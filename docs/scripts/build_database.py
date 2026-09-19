"""
Pipeline de construcción y normalización de la Base de Datos Relacional SQLite
para la investigación doctoral sobre Ubajay (Hexachlamys edulis / Eugenia involucrata).

Fuente principal: database.xlsx (92 hojas)
Destino: data/database/ubajay_research.db y data/database/schema.sql
"""

import os
import re
import sqlite3
import unicodedata
import pandas as pd
from pathlib import Path

BASE_DIR = Path(r"E:\BACKUP_ANTES_SSD\ipovilonis\Code\eugeniamyrcianthes")
EXCEL_PATH = BASE_DIR / "database.xlsx"
DB_DIR = BASE_DIR / "data" / "database"
DB_PATH = DB_DIR / "ubajay_research.db"
SCHEMA_PATH = DB_DIR / "schema.sql"
METADATA_CSV = BASE_DIR / "data" / "processed" / "tables_metadata.csv"

# Diccionario de mapeo de hojas a nombres de tablas SQL limpios y modulares
TABLE_MAPPING = {
    # Capítulo II: Sitios, Clima, Suelos y Ecología
    "II_ER_caracterizacion": "site_er_characterization",
    "II_ER_ndvi_evi": "site_er_ndvi_evi_indices",
    "II_Rubi": "site_rubi_coordinates",
    "II_ER_CAR": "site_er_tree_dendrometry",
    "II_Cor_poblaciones": "site_concordia_populations",
    "II_ER_clima": "climate_er_monthly_summary",
    "II_ER_SMN": "climate_er_smn_daily_records",
    "II_ER_SMN_G2023": "climate_er_smn_gualeguaychu_2023",
    "II_ER_par": "climate_er_photosynthetically_active_radiation",
    "II_ER_DL": "climate_er_day_length",
    "II_M_inta": "climate_moreno_inta_weather_records",
    "II_M_completa": "climate_moreno_weather_complete",
    "II_M_heladas": "climate_moreno_frost_events",
    "II asociated": "ecology_associated_species_census",
    "II forest": "ecology_forest_cover_evolution",
    "II aquaterr": "ecology_aquatic_terrestrial_transition",
    "II suelo": "ecology_soil_properties_entre_rios",
    "II soil_density": "ecology_soil_bulk_density",
    "II companion2": "ecology_companion_species_detailed",
    "II discriminant": "ecology_discriminant_analysis",
    "II companion": "ecology_companion_species_occurrences",
    "II companion_pa": "ecology_companion_presence_absence",
    "II antro": "ecology_anthropogenic_influence",
    "II data_clust": "ecology_clustering_variables",
    "II bio_index": "ecology_biodiversity_indices_alpha",
    "II bio_index2": "ecology_biodiversity_indices_beta",
    "II bio_index3": "ecology_biodiversity_indices_gamma",

    # Capítulo III: Fenología, Floración, Polinización y Rendimiento
    "III_federacion": "phenology_federacion_site",
    "III_fenologia": "phenology_developmental_stages",
    "III poliniza": "pollination_experiments_seed_set",
    "III polin": "pollination_rates",
    "III sumatermica": "phenology_thermal_sum_accumulation",
    "III rendmor": "yield_moreno_annual_records",
    "III rendmor2": "yield_moreno_plant_observations",
    "III modelo_rend": "yield_prediction_models",
    "III Modelos ST": "yield_thermal_sum_regression_models",

    # Capítulo IV: Maduración de Frutos y Bioquímica
    "IV madurez": "maturity_physical_chemical_stages",
    "mad_color": "maturity_cie_lab_colorimetry",
    "mad_aaox": "maturity_antioxidant_activity",
    "mad_phenols": "maturity_total_polyphenols",
    "mad_Acids": "maturity_organic_acids_profile",
    "mad_CHac": "maturity_soluble_carbohydrates",
    "mad_Almi": "maturity_starch_content",
    "mad_Cationes": "maturity_mineral_cations",
    "mad_Fibras": "maturity_dietary_fiber_fractions",
    "mad_PCA": "maturity_multivariate_pca_coordinates",

    # Capítulo V: Variabilidad Fenotípica, Morfología y Repetibilidad
    "V branches": "variability_branch_architecture",
    "V ramas": "variability_shoot_growth_dynamics",
    "V repvars": "variability_reproductive_variables",
    "V polen_ger": "variability_in_vitro_pollen_germination",
    "V fisico": "variability_fruit_physical_dimensions",
    "V color": "variability_fruit_colorimetry",
    "V varqui": "variability_chemical_composition",
    "V quimico": "variability_secondary_metabolites",
    "V psp": "variability_pulp_dry_matter",
    "V acidezsolidos": "variability_titratable_acidity_brix",
    "V ledesma": "variability_ledesma_accession",
    "V ef_reproductiva": "variability_reproductive_efficiency",
    "V datamorf": "variability_morphological_measurements",
    "V VAR": "variability_variance_components",
    "V ICC": "variability_intraclass_correlation_coefficients",
    "REPETIBILIDAD": "variability_genetic_repeatability_parameters",

    # Capítulo VI: Fisiología Postcosecha y Conservación
    "VI respiration": "postharvest_respiration_rates",
    "VI respiracion": "postharvest_respiration_kinetics_daily",
    "VI respiracion2": "postharvest_respiration_replicates",
    "VI climateric_color": "postharvest_climacteric_color_evolution",
    "VI PosCord": "postharvest_cordoba_cold_storage",
    "VI PesoSpread": "postharvest_weight_loss_kinetics",
    "VI ColorSpread": "postharvest_color_spread_matrix",
    "VI Puncion": "postharvest_puncture_firmness_test",
    "VI BTG": "postharvest_texture_shear_force",
    "Ensayo 5": "postharvest_conservation_trial_5",
    "Ensayo 6": "postharvest_conservation_trial_6",
    "VI Datac": "postharvest_climacteric_parameters",
    "VI BTG2": "postharvest_texture_firmness_replicates",
    "VI Compre": "postharvest_compression_elasticity_test",
    "VI UNLP conserva1": "postharvest_unlp_cold_storage_trial_1",
    "VI UNLP conserva2": "postharvest_unlp_cold_storage_trial_2",
    "VI UNLP conserva3": "postharvest_unlp_cold_storage_trial_3",
    "UNLP4_PCA": "postharvest_unlp_multivariate_pca",

    # Ensayos Conexos, Secado y Biotecnología
    "aaoF": "biochem_antioxidant_activity_fresh_samples",
    "2022_quimico": "biochem_chemical_profile_campaign_2022",
    "homvar": "biostatistics_variance_homogeneity_tests",
    "homvarcar": "biostatistics_carbohydrates_variance_homogeneity",
    "Prueba_secado": "processing_drying_preliminary_trial",
    "Secado_car": "processing_drying_carbohydrates_dynamics",
    "calafate": "comparative_calafate_phenotypic_profile",
    "calafate2": "comparative_calafate_antioxidants",
    "Secado_aao": "processing_drying_antioxidant_retention",
    "Secado_anto": "processing_drying_anthocyanin_degradation",
    "ER_flores_completa": "phenology_entre_rios_flower_survey_complete",
    "microprop": "biotechnology_in_vitro_micropropagation",
}

def clean_column_name(col_name: str, index: int) -> str:
    """Sanitiza nombres de columnas a snake_case compatible con SQL ANSI."""
    s = str(col_name).strip()
    if not s or s.startswith("Unnamed:"):
        return f"col_{index}"
    # Normalizar tildes y caracteres acentuados
    s = unicodedata.normalize('NFKD', s).encode('ASCII', 'ignore').decode('utf-8')
    # Reemplazar símbolos comunes
    s = s.replace("%", "pct").replace("/", "_per_").replace("-", "_").replace(".", "_")
    s = re.sub(r"[^\w\s]", "", s)
    s = re.sub(r"\s+", "_", s).lower().strip("_")
    # Asegurar que comience con letra si es puramente numérico
    if s and s[0].isdigit():
        s = f"num_{s}"
    return s or f"col_{index}"

def build():
    print(f"[*] Iniciando construcción de la Base de Datos Relacional...")
    print(f"[*] Leyendo archivo fuente: {EXCEL_PATH}")
    
    DB_DIR.mkdir(parents=True, exist_ok=True)
    (BASE_DIR / "data" / "processed").mkdir(parents=True, exist_ok=True)
    
    if DB_PATH.exists():
        DB_PATH.unlink()
        print(f"[*] Base de datos existente eliminada para regeneración limpia.")

    conn = sqlite3.connect(str(DB_PATH))

    xl = pd.ExcelFile(EXCEL_PATH)
    metadata = []

    for sheet in xl.sheet_names:
        table_name = TABLE_MAPPING.get(sheet)
        if not table_name:
            table_name = clean_column_name(sheet, 0)
        
        try:
            df = xl.parse(sheet)
        except Exception as e:
            print(f"[!] Error leyendo hoja '{sheet}': {e}")
            continue

        if df.empty:
            print(f"[-] Hoja '{sheet}' vacía. Se omite.")
            continue

        # Limpiar columnas
        seen_cols = {}
        cleaned_cols = []
        for i, col in enumerate(df.columns):
            c = clean_column_name(col, i)
            if c in seen_cols:
                seen_cols[c] += 1
                c = f"{c}_{seen_cols[c]}"
            else:
                seen_cols[c] = 1
            cleaned_cols.append(c)
        df.columns = cleaned_cols

        # Eliminar columnas y filas totalmente vacías
        df = df.dropna(how="all", axis=1)
        df = df.dropna(how="all", axis=0)

        # Inserción en SQLite
        df.to_sql(table_name, conn, if_exists="replace", index=False)

        # Guardar metadatos
        metadata.append({
            "original_sheet": sheet,
            "table_name": table_name,
            "rows": len(df),
            "columns": len(df.columns),
            "column_names": ", ".join(df.columns)
        })

        print(f" [OK] Tabla '{table_name}' creada ({len(df)} filas, {len(df.columns)} columnas) <- '{sheet}'")

    # Exportar esquema DDL a schema.sql
    print(f"[*] Generando archivo de esquema DDL: {SCHEMA_PATH}")
    cursor = conn.cursor()
    with open(SCHEMA_PATH, "w", encoding="utf-8") as f:
        f.write("-- ====================================================================\n")
        f.write("-- Base de Datos Relacional de Investigacion: Ubajay (Hexachlamys edulis)\n")
        f.write("-- Dr. Ignacio Sebastian Povilonis - Tesis Doctoral FAUBA / CONICET\n")
        f.write("-- Formato: SQLite 3\n")
        f.write("-- ====================================================================\n\n")
        for row in cursor.execute("SELECT sql FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';"):
            if row[0]:
                f.write(f"{row[0]};\n\n")

    # Guardar metadatos a CSV
    meta_df = pd.DataFrame(metadata)
    meta_df.to_csv(METADATA_CSV, index=False, encoding="utf-8")
    print(f"[*] Catalogo de metadatos exportado a: {METADATA_CSV}")

    # Chequeo de integridad
    cursor.execute("PRAGMA integrity_check;")
    check = cursor.fetchone()
    print(f"[*] Chequeo de integridad de base de datos: {check[0]}")
    cursor.close()

    conn.close()
    print(f"[OK] Base de datos creada con exito en: {DB_PATH}")

if __name__ == "__main__":
    build()

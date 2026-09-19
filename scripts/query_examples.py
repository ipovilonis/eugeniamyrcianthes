"""
Ejemplos de consulta a la Base de Datos Relacional 'ubajay_research.db' usando Python y Pandas.
"""

import sqlite3
import pandas as pd
from pathlib import Path

DB_PATH = Path(__file__).resolve().parent.parent / "data" / "database" / "ubajay_research.db"

def main():
    print(f"Conectando a la base de datos: {DB_PATH}")
    conn = sqlite3.connect(DB_PATH)

    # 1. Listar tablas disponibles
    tables_df = pd.read_sql_query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name;", conn)
    print(f"\n[+] Total de tablas disponibles: {len(tables_df)}")
    print("Primeras 10 tablas:")
    print(tables_df.head(10).to_string(index=False))

    # 2. Consulta sobre estadios de maduración de frutos
    query_mad = """
        SELECT 
            madurez as estadio_madurez,
            COUNT(*) as n_muestras,
            ROUND(AVG(pff), 2) as peso_fresco_promedio,
            ROUND(AVG(dp), 2) as diametro_polar_promedio,
            ROUND(AVG(de), 2) as diametro_ecuatorial_promedio
        FROM maturity_physical_chemical_stages
        WHERE madurez IS NOT NULL
        GROUP BY madurez
        ORDER BY madurez;
    """
    df_mad = pd.read_sql_query(query_mad, conn)
    print("\n[+] Resumen de maduración por estadio físico:")
    print(df_mad.to_string(index=False))

    # 3. Consulta de sitios de caracterización y coordenadas
    query_sites = """
        SELECT 
            site, 
            phenotype, 
            latitude, 
            longitude, 
            altitude 
        FROM site_er_characterization 
        LIMIT 5;
    """
    df_sites = pd.read_sql_query(query_sites, conn)
    print("\n[+] Muestra de coordenadas y sitios de colecta:")
    print(df_sites.to_string(index=False))

    # 4. Variabilidad de fruto: peso fresco (pff) y dimensiones por sitio
    query_fruit = """
        SELECT 
            site,
            COUNT(*) as total_frutos,
            ROUND(AVG(pff), 2) as peso_fresco_medio_g,
            ROUND(MIN(pff), 2) as peso_min_g,
            ROUND(MAX(pff), 2) as peso_max_g,
            ROUND(AVG(de), 2) as diametro_ecuatorial_medio_mm
        FROM variability_fruit_physical_dimensions
        WHERE pff IS NOT NULL
        GROUP BY site;
    """
    df_fruit = pd.read_sql_query(query_fruit, conn)
    print("\n[+] Estadísticas de peso de fruto y calibre por sitio:")
    print(df_fruit.to_string(index=False))

    conn.close()
    print("\n[OK] Consultas de prueba ejecutadas exitosamente.")

if __name__ == "__main__":
    main()

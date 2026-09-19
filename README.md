# Ecofisiología, Variabilidad y Calidad de Fruto en Ubajay (*Hexachlamys edulis* / *Eugenia myrcianthes*)

[![SQLite](https://img.shields.io/badge/Database-SQLite_3-003B57?logo=sqlite&logoColor=white)](data/database/ubajay_research.db)
[![R](https://img.shields.io/badge/Language-R_4.x-276DC3?logo=r&logoColor=white)](scripts/query_examples.R)
[![Python](https://img.shields.io/badge/Language-Python_3.10+-3776AB?logo=python&logoColor=white)](scripts/query_examples.py)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Status](https://img.shields.io/badge/Status-Reproducible_Research-success.svg)]()

> **Repositorio de datos científicos, modelos analíticos y base de datos relacional** correspondiente a la investigación doctoral del **Dr. Ignacio Sebastián Povilonis** (Facultad de Agronomía, Universidad de Buenos Aires - CONICET).

---

## 📌 Descripción del Proyecto

El **Ubajay** (*Hexachlamys edulis* (O. Berg) Kausel & D. Legrand, syn. *Eugenia myrcianthes* Nied., Myrtaceae) es un frutal nativo del Cono Sur sudamericano con un extraordinario potencial agroecológico, nutricional y biotecnológico. 

Este repositorio centraliza y estructura **más de 6 años de investigación experimental**, abarcando:
1. **Ecología y Caracterización de Sitios:** Climatología regional (Entre Ríos y Buenos Aires), dinámica de suelos, índices espectrales (NDVI/EVI) y comunidades vegetales asociadas.
2. **Fenología y Biología Reproductiva:** Dinámica de floración, suma térmica acumulada ($GDD$), biología de polinización y modelos de predicción de rendimiento.
3. **Bioquímica y Fisiología de Maduración:** Evolución de sólidos solubles ($^\circ\text{Brix}$), acidez titulable, ácidos orgánicos individuales, azúcares solubles, almidón, minerales (cationes), fibra dietaria y polifenoles con capacidad antioxidante.
4. **Variabilidad Fenotípica y Genética:** Morfometría de copa, hojas y frutos, repetibilidad genética ($r$), correlación intraclase ($ICC$) y componentes de varianza en poblaciones naturales.
5. **Comportamiento Postcosecha:** Cinética respiratoria ($CO_2$), evolución de ablandamiento/firmeza, pérdida de peso y ensayos de conservación en frío (0 °C a 10 °C).

---

## 🗄️ Base de Datos Relacional (`ubajay_research.db`)

Para garantizar la reproducibilidad y el acceso directo a los datos sin depender de archivos de hoja de cálculo monolíticos, todos los registros experimentales han sido estructurados en una **base de datos relacional SQLite 3** normalizada y lista para producción:

* **Archivo de base de datos:** [`data/database/ubajay_research.db`](data/database/ubajay_research.db) (~4.5 MB)
* **Definición de esquema DDL:** [`data/database/schema.sql`](data/database/schema.sql)
* **Catálogo de tablas:** [`data/processed/tables_metadata.csv`](data/processed/tables_metadata.csv)
* **Script de ingestión automatizado:** [`scripts/build_database.py`](scripts/build_database.py)

### Módulos Principales de la Base de Datos (90 tablas normalizadas)

| Módulo Temático | Prefijo de Tablas | Ejemplos de Tablas | Descripción |
| :--- | :--- | :--- | :--- |
| **Sitios y Clima** | `site_`, `climate_` | `site_er_characterization`, `climate_er_smn_daily_records`, `climate_moreno_frost_events` | Coordenadas de fenotipos, series meteorológicas diarias (SMN / INTA), heladas y radiación PAR. |
| **Ecología y Suelos** | `ecology_` | `ecology_soil_properties_entre_rios`, `ecology_associated_species_census`, `ecology_biodiversity_indices_alpha` | Propiedades edáficas, textura, densidad aparente, inventarios florísticos e índices de diversidad. |
| **Fenología y Rendimiento** | `phenology_`, `yield_` | `phenology_developmental_stages`, `pollination_experiments_seed_set`, `yield_moreno_annual_records` | Estadios BBCH/escalas fenológicas, tasas de cuajado, polinización y modelos de cosecha. |
| **Maduración de Fruto** | `maturity_` | `maturity_physical_chemical_stages`, `maturity_cie_lab_colorimetry`, `maturity_total_polyphenols` | Cambios físico-químicos por estadio, color CIE $L^*a^*b^*$, perfil de ácidos y azúcares. |
| **Variabilidad y Repetibilidad**| `variability_` | `variability_fruit_physical_dimensions`, `variability_genetic_repeatability_parameters` | Biometría de frutos individuales, morfología foliar, coeficientes de repetibilidad y ANOVA. |
| **Postcosecha y Conservación** | `postharvest_` | `postharvest_respiration_kinetics_daily`, `postharvest_puncture_firmness_test`, `postharvest_unlp_cold_storage_trial_1` | Tasa de respiración climactérica, pérdida de peso, firmeza de pulpa y daño por frío. |
| **Procesamiento y Otros** | `processing_`, `comparative_`| `processing_drying_antioxidant_retention`, `comparative_calafate_antioxidants` | Ensayos de deshidratación/secado, cinética de antioxidantes y comparaciones con Calafate. |

---

## 🚀 Cómo Consultar la Base de Datos

### En Python (usando `sqlite3` y `pandas`)

```python
import sqlite3
import pandas as pd

# Conectar a la base de datos
conn = sqlite3.connect("data/database/ubajay_research.db")

# Consulta: Calibre y peso de fruto por sitio de recolección
query = """
    SELECT 
        site,
        COUNT(*) as total_frutos,
        ROUND(AVG(pff), 2) as peso_fresco_medio_g,
        ROUND(AVG(de), 2) as diametro_ecuatorial_mm
    FROM variability_fruit_physical_dimensions
    WHERE pff IS NOT NULL
    GROUP BY site;
"""
df = pd.read_sql_query(query, conn)
print(df)
conn.close()
```

### En R (usando `DBI` y `RSQLite`)

```r
library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), "data/database/ubajay_research.db")

# Consulta: Evolución de peso y dimensiones durante la maduración
res <- dbGetQuery(con, "
    SELECT 
        madurez as estadio,
        COUNT(*) as n,
        ROUND(AVG(pff), 2) as peso_promedio_g,
        ROUND(AVG(de), 2) as diametro_ecuatorial_mm
    FROM maturity_physical_chemical_stages
    GROUP BY madurez
    ORDER BY madurez;
")
print(res)
dbDisconnect(con)
```

*(Consulta los scripts completos en [`scripts/query_examples.py`](scripts/query_examples.py) y [`scripts/query_examples.R`](scripts/query_examples.R)).*

---

## 📂 Arquitectura del Repositorio

```text
eugeniamyrcianthes/
├── README.md                      # Documentación del proyecto, arquitectura y guía de uso
├── _site.yml                      # Configuración de compilación R Markdown (salida a docs/)
├── styles.css                     # Estilos de la plataforma web de visualización
├── header.html                    # Cabecera HTML y metadatos web
├── .gitignore                     # Filtros de exclusión para temporales de R, Office y SO
├── renv.lock                      # Entorno reproducible de paquetes R
├── data/
│   ├── database/
│   │   ├── ubajay_research.db     # Base de datos relacional SQLite (90 tablas normalizadas)
│   │   └── schema.sql             # Definición completa del esquema SQL DDL
│   ├── processed/
│   │   └── tables_metadata.csv    # Diccionario y catálogo de metadatos de las tablas
│   └── raw/                       # Datasets maestros originales (.xlsx, .csv, shapefiles, txt)
├── scripts/
│   ├── build_database.py          # Pipeline de extracción, limpieza y generación de SQLite
│   ├── query_examples.py          # Guía práctica de consultas analíticas en Python
│   └── query_examples.R           # Guía práctica de consultas analíticas en R
├── analysis/                      # Cuadernos de análisis (.Rmd) organizados por capítulo
│   ├── 01_sites_ecology/          # Climatología, caracterización de sitios y suelos
│   ├── 02_phenology_yield/        # Fenología, suma térmica y modelos de producción
│   ├── 03_maturity_biochemistry/  # Parámetros físicos, químicos y metabólicos de madurez
│   ├── 04_postharvest/            # Ensayos de conservación en frío y respiración
│   ├── 05_variability/            # Morfometría, arquitectura de copa y repetibilidad
│   └── 06_other_trials/           # Secado, micropropagación y genética
├── figures/                       # Gráficos de alta resolución y fotografías de campo
└── docs/                          # Sitio web compilado estático para GitHub Pages
```

---

## 🌐 Sitio Web de Visualización de Datos

El repositorio cuenta con un sitio web estático interactivo generado mediante **R Markdown Website**, configurado para compilarse limpiamente dentro del directorio `docs/` y ser servido directamente por **GitHub Pages**:

* **URL del Portal Web:** [https://ipovilonis.github.io/eugeniamyrcianthes/](https://ipovilonis.github.io/eugeniamyrcianthes/)
* **Compilación:** Ejecuta `rmarkdown::render_site()` desde R para regenerar el portal web completo en `docs/` sin desordenar la raíz.

---

## 🔬 Autor y Contacto

* **Dr. Ignacio Sebastián Povilonis**  
  *Doctor en Ciencias Agropecuarias (UBA) | Ingeniero Agrónomo (UM)*  
  *Investigador & Asesor CREA | AgTech Product Scientist & Data Analyst*  
  *Email:* [ignaciopovilonis@gmail.com](mailto:ignaciopovilonis@gmail.com)  
  *LinkedIn:* [linkedin.com/in/ignacio-povilonis](https://www.linkedin.com/in/ignacio-povilonis/)  
  *GitHub:* [@ipovilonis](https://github.com/ipovilonis)

---

## 📄 Licencia

Este repositorio de datos y código está disponible bajo la licencia **Creative Commons Attribution 4.0 International (CC BY 4.0)**. Puedes compartir y adaptar el material siempre que se otorgue el crédito correspondiente al autor original.

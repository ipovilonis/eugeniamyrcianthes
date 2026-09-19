# ==============================================================================
# Ejemplos de consulta a la Base de Datos Relacional 'ubajay_research.db' usando R
# Requiere: install.packages(c("DBI", "RSQLite", "dplyr"))
# ==============================================================================

library(DBI)
library(RSQLite)

# Ruta hacia la base de datos SQLite
db_path <- file.path("data", "database", "ubajay_research.db")

if (!file.exists(db_path)) {
  # Si se ejecuta desde la carpeta scripts/
  db_path <- file.path("..", "data", "database", "ubajay_research.db")
}

con <- dbConnect(RSQLite::SQLite(), db_path)

cat("--- Base de datos conectada exitosamente ---\n")

# 1. Listar todas las tablas disponibles en el repositorio
tables <- dbListTables(con)
cat(sprintf("Total de tablas disponibles: %d\n\n", length(tables)))

# 2. Consulta 1: Estadios de maduración y parámetros morfométricos
query_mad <- "
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
"
res_mad <- dbGetQuery(con, query_mad)
cat("Resumen de maduracion de frutos:\n")
print(res_mad)
cat("\n")

# 3. Consulta 2: Sitios de colecta y coordenadas geograficas
query_sites <- "
  SELECT 
    site, 
    phenotype, 
    latitude, 
    longitude, 
    altitude 
  FROM site_er_characterization 
  LIMIT 5;
"
res_sites <- dbGetQuery(con, query_sites)
cat("Coordenadas geograficas de los sitios de colecta:\n")
print(res_sites)
cat("\n")

# 4. Consulta 3: Variabilidad biometrica de frutos por poblacion
query_fruit <- "
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
"
res_fruit <- dbGetQuery(con, query_fruit)
cat("Biometria de frutos por sitio:\n")
print(res_fruit)

# Desconectar
dbDisconnect(con)
cat("\n[OK] Consultas finalizadas.\n")

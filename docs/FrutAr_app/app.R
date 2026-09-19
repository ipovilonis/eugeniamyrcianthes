library(shiny)
library(dplyr)
library(tidyr)
library(readr)

# Cargar datos de frutales nativos
frutales <- read_delim(
  "data_base_CFN.txt",
  delim     = "\t",
  col_types = cols(.default = "c")
)

# Expandir filas por cada provincia en "Distribución"
frutales2 <- frutales %>%
  mutate(Distribución = gsub("\\s+", "", Distribución)) %>%
  separate_rows(Distribución, sep = ",") %>%
  rename(prov = Distribución)

# Mapeo de códigos a nombres completos de provincia
prov_names <- c(
  BA = "Buenos Aires",
  CM = "Catamarca",
  CH = "Chaco",
  CU = "Chubut",
  CR = "Córdoba",
  CS = "Corrientes",
  ER = "Entre Ríos",
  FS = "Formosa",
  FR = "Formosa",
  JJ = "Jujuy",
  LP = "La Pampa",
  LR = "La Rioja",
  MZ = "Mendoza",
  MS = "Misiones",
  NQ = "Neuquén",
  RN = "Río Negro",
  SC = "Santa Cruz",
  SF = "Santa Fe",
  SJ = "San Juan",
  SL = "Salta",
  SE = "Santiago del Estero",
  ST = "Santa Cruz",  # Si hubiera duplicados, ajusta según necesidad
  TC = "Tucumán",
  TF = "Tierra del Fuego"
)

# Crear lista de elecciones: valores=code, etiquetas nombre completo
prov_choices <- unique(frutales2$prov)
prov_labels  <- prov_names[prov_choices]
# Sustituir NA con el mismo código
prov_labels[is.na(prov_labels)] <- prov_choices[is.na(prov_labels)]
# Ordenar alfabéticamente por etiqueta
ord <- order(prov_labels)
prov_choices <- prov_choices[ord]
prov_labels  <- prov_labels[ord]

ui <- fluidPage(
  titlePanel("FrutAr: Seleccione Provincia"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "prov",
        label   = "Provincia:",
        choices = setNames(prov_choices, prov_labels),
        selected = prov_choices[1]
      )
    ),
    mainPanel(
      h3("Frutales nativos disponibles"),
      tableOutput("table")
    )
  )
)

server <- function(input, output, session) {
  # Filtrar datos según provincia seleccionada
  selected <- reactive({
    frutales2 %>%
      filter(prov == input$prov) %>%
      select(Especie, `Nombre común`) %>%
      distinct()
  })
  
  # Mostrar tabla
  output$table <- renderTable({
    df <- selected()
    if (nrow(df) == 0) {
      data.frame(Mensaje = "No hay frutales listados para esta provincia.")
    } else {
      df
    }
  }, striped = TRUE, bordered = TRUE)
}

shinyApp(ui = ui, server = server)


pkgs <- c(
  "dashboardthemes",
  "devtools",
  "dplyr",
  "lubridate",
  "ggplot2",
  "plotly",
  "golem",
  "pins",
  "shiny",
  "shinyjs",
  "shinyWidgets",
  "shinydashboard",
  "shinydashboardPlus"
)

for (i in pkgs) {
  library(i, character.only = TRUE)
}

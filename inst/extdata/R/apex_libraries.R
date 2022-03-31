
pkgs <- c(
  "dashboardthemes",
  "devtools",
  "dplyr",
  "lubridate",
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

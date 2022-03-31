## 1.1 Add dependencies

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
  usethis::use_package(i)
}

## 1.2 add app.R file for publishing (be sure to enter 1 in the console prompt)

golem::add_rstudioconnect_file(open = FALSE)

## 1.3 add manifest for CI/CD

rsconnect::writeManifest()

## 1.4 go to run_dev.R and ensure the empty dashboard loads

rstudioapi::navigateToFile("dev/run_dev.R")

## 1.5 Add modules in console

# graveler::level_up(name = "my_first_module") # Name of the module

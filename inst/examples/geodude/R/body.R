body <- function() {
  dashboardBody(
    theme_dashboard(),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js")
    ),
    tabItems(
      mod_quartet_ui("quartet_ui_1"),
      mod_mtcars_ui("mtcars_ui_1")
    )
  )
}

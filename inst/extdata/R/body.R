body <- function() {
  dashboardBody(
    theme_dashboard(),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js")
    ),
    tabItems(
      #Add ui module here (e.g., uiOne("one"))
    )
  )
}

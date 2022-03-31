sidebar <- function() {
  dashboardSidebar(
    sidebarMenu(
      menuItem("Quartet",tabName = "quartet",icon = icon("dice-four")),
      menuItem("Mtcars",tabName = "mtcars",icon = icon("car"))
    )
  )
}

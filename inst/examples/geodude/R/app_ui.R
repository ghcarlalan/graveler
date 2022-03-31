
app_ui <- function() {
  tagList(
    golem_add_external_resources()
  )
  dashboardPage(
    header(),
    sidebar(),
    body()
  )
}

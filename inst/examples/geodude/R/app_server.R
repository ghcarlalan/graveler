
app_server <- function(input, output, session) {
  # pins::board_register() # connect to pin board if needed
  callModule(mod_quartet_server, "quartet_ui_1")
  callModule(mod_mtcars_server, "mtcars_ui_1")
}

# Module UI
 
#' @title mod_foo_ui and mod_foo_server
#' @description A shiny module.
 
mod_foo_ui <- function(id) {
	ns <- NS(id)
	tabItem(
		tabName = "foo",
		fluidRow(
			
		)
	)
}
 
# Module Server
 
mod_foo_server <- function(input, output, session) {
	ns <- session$ns
}
 
## copy to body.R
# mod_foo_ui("foo_ui_1")
 
## copy to app_server.R
# callModule(mod_foo_server, "foo_ui_1")
 
## copy to sidebar.R
# menuItem("displayName",tabName = "foo",icon = icon("user"))
 

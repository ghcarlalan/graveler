# Module UI

#' @title mod_quartet_ui and mod_quartet_server
#' @description A shiny module.

mod_quartet_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = 'quartet',
    fluidRow(
      box(width = 6, plotlyOutput(ns("one"), height = "300px")),
      box(width = 6, plotlyOutput(ns("two"), height = "300px"))
    ),
    fluidRow(
      box(width = 6, plotlyOutput(ns("three"), height = "300px")),
      box(width = 6, plotlyOutput(ns("four"), height = "300px"))
    )
  )
}

# Module Server

mod_quartet_server <- function(input, output, session) {
  ns <- session$ns

  dt <- datasets::anscombe

  output$one <- renderPlotly({
    dt %>% anscombe_plot(1)
  })

  output$two <- renderPlotly({
    dt %>% anscombe_plot(2)
  })

  output$three <- renderPlotly({
    dt %>% anscombe_plot(3)
  })

  output$four <- renderPlotly({
    dt %>% anscombe_plot(4)
  })
}

## copy to body.R
# mod_quartet_ui("quartet_ui_1")

## copy to app_server.R
# callModule(mod_quartet_server, "quartet_ui_1")

## copy to sidebar.R
# menuItem("displayName",tabName = "quartet",icon = icon("user"))


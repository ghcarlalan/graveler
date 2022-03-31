# Module UI

#' @title mod_mtcars_ui and mod_mtcars_server
#' @description A shiny module.

mod_mtcars_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = 'mtcars',
    fluidRow(
      column(4, uiOutput(ns("cols"))),
      column(4, uiOutput(ns("cols_dep")))
    ),
    fluidRow(
      box(width = 12, plotlyOutput(ns("plot")))
    )
  )
}

# Module Server

mod_mtcars_server <- function(input, output, session) {
  ns <- session$ns

  dt <- datasets::mtcars

  output$cols <- renderUI({
    selectizeInput(ns("cols"), label = "X Var", choices = names(dt))
  })

  output$cols_dep <- renderUI({
    selectizeInput(ns("cols_dep"), label = "Y Var", choices = names(dt)[!names(dt) == input$cols])
  })

  output$plot <- renderPlotly({
    validate(
      need(input$cols, "Waiting.."),
      need(input$cols_dep, "Waiting..")
    )


    p <- dt %>%
      ggplot(
        aes(x = eval(sym(input$cols)), y = eval(sym(input$cols_dep)))
      ) +
      geom_point(color = "orange", size = 3) +
      theme_bw() +
      labs(
        x = input$cols,
        y = input$cols_dep,
        title = paste("Plot of", input$cols, "by", input$cols_dep)
      )

    ggplotly(p)
  })

}

## copy to body.R
# mod_mtcars_ui("mtcars_ui_1")

## copy to app_server.R
# callModule(mod_mtcars_server, "mtcars_ui_1")

## copy to sidebar.R
# menuItem("displayName",tabName = "mtcars",icon = icon("user"))


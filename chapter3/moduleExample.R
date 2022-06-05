# Example of module (practice)s

library(shiny)

# Module ui part
ui_mod <- function(id, input_name = "num:") {
  ns <- NS(id)
  shiny::fluidRow(
    shiny::numericInput(
      ns("numeric"),
      label = input_name,
      value = 1
    ),
    shiny::textOutput(
      ns("text")
    )
  )
}

# Module server part
server_mod <- function(id, ...) {
  shiny::moduleServer(
    id,
    function(input, output, session, ...) {
      output$text <- shiny::renderText({
        req(input$numeric)
        2 * input$numeric
      })
    }
  )
}
# App
ui1 <- function() {
    ui_mod("mod1")
  
}

server1 <- function(input, output, session) {
  server_mod("mod1")
}

shiny::shinyApp(ui1, server1)

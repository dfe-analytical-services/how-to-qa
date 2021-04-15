#This notebook creates a shiny app with a quiz for the How To QA document

## Loading Libraries Needed
library(shiny)
library(tidyverse)
library(shinythemes) #theme -> css

ui <- fluidPage(
  headerPanel("Quiz"),
  mainPanel(
    fluidRow(column(12,h5("This is question one"))),
    fluidRow(column(12,uiOutput("questiononeanswers")
      ),
  )
))

server <- shinyServer( function(input, output, session) {
  output$questiononeanswers <- renderUI({
    checkboxGroupInput("qone", "Here is question one. What do you think the answers are?", c("Answer one", "Answer two", "Answer three", "Answer four"), selected = "Current members")
  })
})

shinyApp(ui,server)

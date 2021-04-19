library(shiny)
library(tidyverse)
library(shinythemes) #theme -> css

ui <- fluidPage(
  uiOutput("test"),
  uiOutput("testnum"))

server <- shinyServer( function(input, output, session) {
  
  output$test <- renderUI({
    radioButtons("test", "pick one", c("one", "two"), selected=character(0))
  })
  
  output$testnum <- renderPrint({
    score<- if_else(input$test == "one", 1, 0)
    paste(score,"100",sep="_")
  })
  
  
})

shinyApp(ui,server)
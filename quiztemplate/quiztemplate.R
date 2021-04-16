#This notebook creates a shiny app with a quiz for the How To QA document

## Loading Libraries Needed
library(shiny)
library(tidyverse)
library(shinythemes) #theme -> css

source("C:\\Users\\tmorley\\OneDrive - Department for Education\\Documents\\Projects\\How to QA\\bookdown-how-to\\quiztemplate\\question.R")

ui <- fluidPage(
  headerPanel("Quiz"),
  mainPanel(
  
    ## --- Question One ---
    
      fluidRow(column(12,uiOutput("questiononeanswers")
      )
  ),
  conditionalPanel(
    condition = ("input.submit1 != 1"),
    actionButton('submit1', label = "Submit")),
  br(),
  textOutput('textquestion'),
  br(),
  
  ## --- Question Two ---
  
  conditionalPanel(
  condition = ("input.submit1 != 0"),  
  fluidRow(column(12,uiOutput("questiontwoanswers")
  )
  ),
  conditionalPanel(
    condition = ("input.submit2 != 1"),
  actionButton('submit2', label = "Submit")),
  br(),
  textOutput('textquestion2'),
  br()),
  
  ## --- Question Three ---
  
  conditionalPanel(
    condition = ("input.submit2 != 0"),  
  fluidRow(column(12,uiOutput("questionthreeanswers")
  )
  ),
  conditionalPanel(
    condition = ("input.submit3 != 1"),
  actionButton('submit3', label = "Submit")),
  br(),
  textOutput('textquestion3'),
  br()),

  ## --- Question Four ---
  
  conditionalPanel(
    condition = ("input.submit3 != 0"),    
  fluidRow(column(12,uiOutput("questionfouranswers")
  )
  ),
  conditionalPanel(
    condition = ("input.submit4 != 1"),
  actionButton('submit4', label = "Submit")),
  br(),
  textOutput('textquestion4'),
  br())
))

server <- shinyServer( function(input, output, session) {
  
  ## --- Question One ---
  
  output$questiononeanswers <- renderUI({
    radioButtons("qone", "Here is question one. What do you think the answers are?", c("Answer one", "Answer two", "Answer three", "Answer four"), selected=character(0))
  })
  observe({ 
    input$submit1 
    isolate( textquestion1 <- if_else(input$qone == "Answer one", paste("You've answered question one correctly."), paste("You've answered question one incorrectly.")))
    output$textquestion1 <- renderText({textquestion1})
  })
  
  ## --- Question Two ---
  
  output$questiontwoanswers <- renderUI({
    radioButtons("qtwo", "Here is question two. What do you think the answers are?", c("Answer one", "Answer two", "Answer three", "Answer four"), selected=character(0))
  })
  observe({ 
    input$submit2 
    isolate( textquestion2 <- if_else(input$qtwo == "Answer one", paste("You've answered question two correctly."), paste("You've answered question two incorrectly.")))
    output$textquestion2 <- renderText({textquestion2})
  })
  
  ## --- Question Three ---
  
  output$questionthreeanswers <- renderUI({
    radioButtons("qthree", "Here is question three. What do you think the answers are?", c("Answer one", "Answer two", "Answer three", "Answer four"), selected=character(0))
  })
  observe({ 
    input$submit3 
    isolate( textquestion3 <- if_else(input$qthree == "Answer one", paste("You've answered question three correctly."), paste("You've answered question three incorrectly.")))
    output$textquestion3 <- renderText({textquestion3})
  })
  
  ## --- Question Four ---
  
  output$questionfouranswers <- renderUI({
    radioButtons("qfour", "Here is question four. What do you think the answers are?", c("Answer one", "Answer two", "Answer three", "Answer four"), selected=character(0))
  })
  observe({ 
    input$submit4 
    isolate( textquestion4 <- if_else(input$qfour == "Answer one", paste("You've answered question four correctly."), paste("You've answered question four incorrectly.")))
    output$textquestion4 <- renderText({textquestion4})
  })
  
})

shinyApp(ui,server)

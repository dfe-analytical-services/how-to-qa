library(shiny)
library(tidyverse)
library(shinythemes) #theme -> css
library(shinydashboard)
library(shinyWidgets)

ui <- navbarPage("QA Quiz",
                 theme = shinytheme("spacelab"),
                 mainPanel(
  fluidRow(column(6, textOutput("questiononequestion"))),
  fluidRow(column(1,uiOutput("questiononeanswers"), align="right"),
                  column(5,br(),
                         tableOutput("questiononeoptions")))))

server <- shinyServer( function(input, output, session) {

  output$questiononequestion <- renderText({"1. A project is running to a tight deadline, and some analysis needs to be completed quickly. The analysis is fairly straightforward, but some QA needs to be done. Which of the following is the best course of action to take?"})
    
  output$questiononeanswers <- renderUI({
    #Question and answers. Correct answer = q1b
    radioGroupButtons(inputId = "qone",
                      label = "", 
                      choices = c("a." = "q1a", 
                                  "b." = "q1b", 
                                  "c." = "q1c", 
                                  "d." = "q1d"),
                      selected=character(0), #No initial selection
                      status = "primary", #This is the style/colour of the radioGroupButtons
                      checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                       no = icon("remove", lib = "glyphicon")), #Cross if option not selected
                      direction = "vertical")#Options displayed vertically
      })
  
  output$questiononeoptions <- renderTable({c("Concentrate on the analysis, and complete the QA at the last minute. After all, the analysis is more important than the QA and it is unlikely that there will be any mistakes.", 
                                              "Perform relatively little QA because it is deemed unnecessary for the project.", 
                                              "Perform QA as you go along, but don't fill out a QA log as it is not required for such a small piece of work.", 
                                              "Perform all checks listed on the QA log, and put in extra time to ensure that this has been done.")}, colnames=FALSE)
  
  
})

shinyApp(ui,server)
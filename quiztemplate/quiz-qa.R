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
  textOutput('textquestion1'),
  br(),
  textOutput('answerquestion1'),
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
  br(),
  textOutput('answerquestion2'),
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
  br(),
  textOutput('answerquestion3'),
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
  
  ## --- Question One ---------------------------------------------------------
  
  output$questiononeanswers <- renderUI({
    #Question and answers. Correct answer = q1b
    radioButtons("qone", "A project is running to a tight deadline, and some analysis needs to be completed quickly. The analysis is fairly straightforward, but some QA needs to be done. Which of the following is the best course of action to take?", 
                 c("Concentrate on the analysis, and complete the QA at the last minute. After all, the analysis is more important than the QA and it is unlikely that there will be any mistakes." = "q1a", 
                   "Perform relatively little QA because it is deemed unnecessary for the project." = "q1b", 
                   "Perform QA as you go along, but don't fill out a QA log as it is not required for such a small piece of work." = "q1c", 
                   "Perform all checks listed on the QA log, and put in extra time to ensure that this has been done." = "q1d"), selected=character(0))
  })
  #Responses to answers
  observe({ 
    input$submit1 
    isolate( textquestion1 <- if_else(input$qone == "q1a", paste("Incorrect. QA should always be completed alongside the analysis."),
                              if_else(input$qone == "q1b", paste("Correct! QA should always be proportionate to the analysis being done."),
                              if_else(input$qone == "q1c", paste("Incorrect. It is good practice to always complete a QA log, regardless of size and scope of the model."),
                                      paste("Incorrect. QA should always be proportional to the analysis being done. Doing too much QA can be just as detrimental to a project as doing too little.")))))
    output$textquestion1 <- renderText({textquestion1})
  })
  #Explanation of correct answer
  observe({ 
    input$submit1 
    isolate( answerquestion1 <- if_else(input$qone == "q1b", paste(""), paste("QA should always be proportionate to the analysis being done. Therefore, it is good to perform relatively little QA if this is deemed proportional to the project.")))
    output$answerquestion1 <- renderText({answerquestion1})
  })
  
  ## --- Question Two ----------------------------------------------------------
  #Question and answers. Correct answer = q2c
  output$questiontwoanswers <- renderUI({
    radioButtons("qtwo", "A quality assurer looks over a piece of work but is confused about the methods that have been used to arrive at the conclusions. However, the work has been checked thoroughly by the analyst responsible, and the results fit with the expected outcomes. What should the QAer do?", 
                 c("Tell the analyst that that model looks good and raises no concerns."="q2a", 
                   "Assume that the analysis is correct because the results are as expected."="q2b", 
                   "Ask the analyst for more information about the methods to try to understand the work that has been done."="q2c", 
                   "Feedback that the model does not meet QA standards because the method is too complicated to understand."="q2d"), selected=character(0))
  })
  #Responses to answers
  observe({ 
    input$submit2 
    isolate( textquestion2 <- if_else(input$qtwo == "q2a", paste("Incorrect. Be wary - whenever a QAer raises no concerns or doesn't ask any questions, this suggests they haven't actually undertaken robust QA."),
                              if_else(input$qtwo == "q2b", paste("Incorrect. Even if results look correct, it is always important for a QAer to check the analysis that has been done."),
                              if_else(input$qtwo == "q2c", paste("Correct! It is always important for a QAer to ask questions and check all aspects of the model (not just the outcomes!)"),
                                      paste("Incorrect. The QAer should talk to the analyst about the method first to get a better understanding.")))))
    output$textquestion2 <- renderText({textquestion2})
  })
  #Explanation of correct answer
  observe({ 
    input$submit2 
    isolate( answerquestion2 <- if_else(input$qtwo == "q2c", paste(""), paste("It is always important for a QAer to ask questions and check all aspects of the model (not just the outcomes!). Therefore, the QAer should ask for more information about methods before making any judgement.")))
    output$answerquestion2 <- renderText({answerquestion2})
    })
  
  ## --- Question Three -------------------------------------------------------
  
  #Question and answers. Correct answer = q3a
  output$questionthreeanswers <- renderUI({
    radioButtons("qthree", "An analyst is collecting the data on the percentage of KS4 students eligible for free school meals and comparing these year on year. Which of the following statements suggests that the analyst may have made a mistake?",
                 c("In 2016, 400 KS4 pupils across 25,000 schools in the UK were eligible for free school meals."="q3a", 
                   "In 2018, 56% of pupils in London were eligible for free school meals, and 44% were not."="q3b", 
                   "There was a drop of 5% in the number of pupils eligible for free school meals in 2019 (an average of 220 per school) to 2020 (an average of 209 per school)."="q3c", 
                   "There is a bigger percentage of KS4 pupils eligible for free school meals in 2019 (62%) than in 2020 (59%)."="q3d"), selected=character(0))
  })
  #Responses to answer
  observe({ 
    input$submit3 
    isolate( textquestion3 <- if_else(input$qthree == "q3a", paste("Correct! 400 pupils across 25,000 schools suggests 10 million KS4 pupils, which is clearly not true."),
                              if_else(input$qthree == "q3b", paste("Incorrect. Performing a quick balance check, we see that the percentages add to 100% as expected."),
                              if_else(input$qthree == "q3c", paste("Incorrect. A quick calculation shows us that 5% of 220 is 11, so the statement is true."),
                                      paste("Incorrect. The statement appears to be correct from the data shown.")))))
    output$textquestion3 <- renderText({textquestion3})
  })
  #Explanation of correct answer
  observe({ 
    input$submit3 
    isolate( answerquestion3 <- if_else(input$qthree == "q3a", paste(""), paste("It is important to perform sense checks on outputs. Performing a quick sense check on the first statement suggests the UK has 10 million KS4 pupils (400 across 25,000 schools), which is clearly not true.")))
    output$answerquestion3 <- renderText({answerquestion3})
  })
  
  ## --- Question Four ---------------------------------------------------------
  
  #Question and answers. Correct answer = q4b
  output$questionfouranswers <- renderUI({
    radioButtons("qfour", "A quality assuerer agrees to QA a piece of work, but warns the analyst that they do not have a lot of time to dedicate to the QA. What can the analyst do to help the QA'er do their job?", 
                 c("QA the work themselves rather than use a quality assurer"="q4a", 
                   "Make expectations clear to the QAers, with a clear list of what QA is necessary for this piece of work"="q4b", 
                   "Offer to assist them in QAing their work in return"="q4c", 
                   "Tell the quality assurer to focus on QAing the outputs rather than the inputs"="q4d"), selected=character(0))
  })
  #Responses to answer
  observe({ 
    input$submit4 
    isolate( textquestion4 <- if_else(input$qfour == "q4a", paste("Incorrect."),
                              if_else(input$qfour == "q4b", paste("Correct!"),
                              if_else(input$qfour == "q4c", paste("Incorrect."),
                                      paste("Incorrect.")))))
    output$textquestion4 <- renderText({textquestion4})
  })
  #Explanation of correct answer
})

shinyApp(ui,server)

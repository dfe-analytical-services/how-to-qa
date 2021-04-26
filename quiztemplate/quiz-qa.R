#This notebook creates a shiny app with a quiz for the How To QA document

## Loading Libraries Needed
library(shiny)
library(tidyverse)
library(shinythemes) #theme -> css
library(shinydashboard)
library(shinyWidgets)


ui <- navbarPage("QA Quiz",
  theme = shinytheme("spacelab"),
  mainPanel(
    ## --- Intro --------------------------------------------------------------
  conditionalPanel(
    condition=("input.begin != 1"), #panel is hidden once "Begin quiz" is hit
    fluidRow(column(12,"Time to test your QA knowledge! This quiz contains 5 multiple choice questions. Click below to begin.")),
    br(),
    actionButton('begin', label = "Begin Quiz!")),
    
    ## --- Question One -------------------------------------------------------
  conditionalPanel(
    condition = ("input.begin != 0 && input.next1 != 1"), #panel is shown once "Begin QuiZ" is hit and hidden once "Next Question" is hit
      fluidRow(column(12,uiOutput("questiononeanswers")
      )
  ),
  conditionalPanel(
    condition = ("input.submit1 != 1"), #Submit button is hidden once "Submit" is hit
    actionButton('submit1', label = "Submit")),
  br(),
  textOutput('textquestion1'), #Displays "Correct" or "Incorrect" text
  br(),
  textOutput('answerquestion1'), #Provides more feedback if question is incorrect
  br(),
  conditionalPanel(
    condition = ("input.submit1 != 0"), #Next Question button only displayed after answer submitted
    actionButton('next1', label = "Next Question"))),
  
  ## --- Question Two ---------------------------------------------------------
  
  conditionalPanel(
    #Only show panel after Next has been hit for Q1, before Next has been hit for Q2
  condition = ("input.next1 != 0 && input.next2 != 1"),  
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
  br(),
  conditionalPanel(
    condition = ("input.submit2 != 0"),
    actionButton('next2', label = "Next Question"))),
  
  ## --- Question Three -------------------------------------------------------
  
  conditionalPanel(
    condition = ("input.next2 != 0 && input.next3 != 1"),  
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
  br(),
  conditionalPanel(
    condition = ("input.submit3 != 0"),
    actionButton('next3', label = "Next Question"))),

  ## --- Question Four --------------------------------------------------------
  
  conditionalPanel(
    condition = ("input.next3 != 0 && input.next4 != 1"),    
  fluidRow(column(12,uiOutput("questionfouranswers")
  )
  ),
  conditionalPanel(
    condition = ("input.submit4 != 1"),
  actionButton('submit4', label = "Submit")),
  br(),
  textOutput('textquestion4'),
  br(),
  textOutput('answerquestion4'),
  br(),
  conditionalPanel(
    condition = ("input.submit4 != 0"),
    actionButton('next4', label = "Next Question"))),
  
  ## --- Question Five --------------------------------------------------------
  conditionalPanel(
    condition = ("input.next4 != 0 && input.next5 != 1"),    
    fluidRow(column(12,uiOutput("questionfiveanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit5 != 1"),
      actionButton('submit5', label = "Submit")),
    br(),
    textOutput('textquestion5'),
    br(),
    textOutput('answerquestion5'),
    br(),
    conditionalPanel(
      condition = ("input.submit5 != 0"),
      actionButton('next5', label = "Get results"))),
  
  conditionalPanel(
    condition = ("input.next5 != 0"),    
    fluidRow(column(4,"Your score is",
                    
             conditionalPanel(
               condition = ("output.scorecolour != 'FALSE'"),
               fluidRow(column(4,
                               uiOutput("score1",style="Background-color: #d4f7d2;"))),
               fluidRow(column(12,"Nice work, well done!"))),
             
             conditionalPanel(
               condition = ("output.scorecolour != 'TRUE'"),
               fluidRow(column(4,
                               uiOutput("score2",style="Background-color: #f7e1e1;"))),
               fluidRow(column(12,"Revisit some of the earlier topics and try the quiz again."))),
    )
    ),
  ),
  
  br()
  
))

server <- shinyServer( function(input, output, session) {
  
  ## --- Question One ---------------------------------------------------------

  output$questiononeanswers <- renderUI({
    #Question and answers. Correct answer = q1b
    radioGroupButtons(inputId = "qone",
                      label = "1. A project is running to a tight deadline, and some analysis needs to be completed quickly. The analysis is fairly straightforward, but some QA needs to be done. Which of the following is the best course of action to take?", 
                 choices = c("Concentrate on the analysis, and complete the QA at the last minute. After all, the analysis is more important than the QA and it is unlikely that there will be any mistakes." = "q1a", 
                   "Perform relatively little QA because it is deemed unnecessary for the project." = "q1b", 
                   "Perform QA as you go along, but don't fill out a QA log as it is not required for such a small piece of work." = "q1c", 
                   "Perform all checks listed on the QA log, and put in extra time to ensure that this has been done." = "q1d"),
                 selected=character(0), #No initial selection
                 status = "primary", #This is the style/colour of the radioGroupButtons
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick is option selected
                                  no = icon("remove", lib = "glyphicon")), #Cross if option not selected
                 direction = "vertical")#Option displayed vertically
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
    radioGroupButtons("qtwo", "2. A quality assurer looks over a piece of work but is confused about the methods that have been used to arrive at the conclusions. However, the work has been checked thoroughly by the analyst responsible, and the results fit with the expected outcomes. What should the QAer do?", 
                 c("Tell the analyst that that model looks good and raises no concerns."="q2a", 
                   "Assume that the analysis is correct because the results are as expected."="q2b", 
                   "Ask the analyst for more information about the methods to try to understand the work that has been done."="q2c", 
                   "Feedback that the model does not meet QA standards because the method is too complicated to understand."="q2d"),
                 selected=character(0),
                 status = "primary",
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon")),
                 direction = "vertical")
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
    radioGroupButtons("qthree", "3. An analyst is collecting the data on the percentage of KS4 students eligible for free school meals and comparing these year on year. Which of the following statements suggests that the analyst may have made a mistake?",
                 c("In 2016, 400 KS4 pupils across 25,000 schools in the UK were eligible for free school meals."="q3a", 
                   "In 2018, 56% of pupils in London were eligible for free school meals, and 44% were not."="q3b", 
                   "There was a drop of 5% in the number of pupils eligible for free school meals in 2019 (an average of 220 per school) to 2020 (an average of 209 per school)."="q3c", 
                   "There is a bigger percentage of KS4 pupils eligible for free school meals in 2019 (62%) than in 2020 (59%)."="q3d"), 
                 selected=character(0),
                 status = "primary",
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon")),
                 direction = "vertical")
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
    radioGroupButtons("qfour", "4. A quality assurer agrees to QA a piece of work, but warns the analyst that they do not have a lot of time to dedicate to the QA. What can the analyst do to help the QAer do their job?", 
                 c("QA the work themselves rather than use a quality assurer"="q4a", 
                   "Make expectations clear to the QAers, with a clear list of what QA is necessary for this piece of work"="q4b", 
                   "Offer to assist them in QAing their work in return"="q4c", 
                   "Tell the quality assurer to focus on QAing the outputs rather than the inputs"="q4d"), 
                 selected=character(0),
                 status = "primary",
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon")),
                 direction = "vertical")
  })
  #Responses to answer
  observe({ 
    input$submit4 
    isolate( textquestion4 <- if_else(input$qfour == "q4a", paste("Incorrect. Whilst it's useful to QA your own work to begin with, you should always aim to have a quality assurer to look over your work as well."),
                              if_else(input$qfour == "q4b", paste("Correct! Clearly stating which bits of the work require the most thorough QA ensures that good QA is carried out that is appropriate to the project."),
                              if_else(input$qfour == "q4c", paste("Incorrect. Whilst this would be nice, it's not going to help the QAer to QA the current project."),
                                      paste("Incorrect. The inputs are just as important (if not more so!) as the outputs. Both should be given the same care and attention.")))))
    output$textquestion4 <- renderText({textquestion4})
  })
  #Explanation of correct answer
  observe({ 
    input$submit4 
    isolate( answerquestion4 <- if_else(input$qfour == "q4b", paste(""), paste("You can help QAers by making expectations of QA clear from the outset, clearly stating which bits of the work require the most thorough QA.")))
    output$answerquestion4 <- renderText({answerquestion4})
  })
  
  ## --- Question Five ---------------------------------------------------------
  
  #Question and answers. Correct answer = q5a
  output$questionfiveanswers <- renderUI({
    radioGroupButtons("qfive", "5. Which of the following is a good tip for coding?", 
                 c("Keep track of where all the input data has come from"="q5a", 
                   "Keep the code condensed, performing multiple steps in one if possible"="q5b", 
                   "Thoroughly annotate the code after retrieving outputs and ensuring that it works"="q5c", 
                   "Leave in bits of code that are not used any more for completeness"="q5d"), 
                 selected=character(0),
                 status = "primary",
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon")),
                 direction = "vertical")
  })
  #Responses to answer
  observe({ 
    input$submit5 
    isolate( textquestion5 <- if_else(input$qfive == "q5a", paste("Correct! It is important that it is clear for someone to see where the input data has come from, and, if possible, have all input data come from the same place."),
                                      if_else(input$qfive == "q5b", paste("Incorrect. It is often better to keep every step separate, with annotations, to make the process clear to someone who may not be as familiar with your work."),
                                              if_else(input$qfive == "q5c", paste("Incorrect. The code should be annotated whilst you write it, otherwise you may forget the significance of certain parts of the code!"),
                                                      paste("Incorrect. Any unused parts of the code should be deleted.")))))
    output$textquestion5 <- renderText({textquestion5})
  })
  #Explanation of correct answer
  observe({ 
    input$submit5 
    isolate( answerquestion5 <- if_else(input$qfive == "q5b", paste(""), paste("It is important that it is clear for someone to see where the input data has come from, and, if possible, have all input data come from the same place. Therefore, keeping track of input data is of vital importance.")))
    output$answerquestion5 <- renderText({answerquestion5})
  })
  
  ## --- What's your score? ---------------------------------------------------
  
  #Correct answers are q1b, q2c, q3a, q4b, q5a
  score <- reactiveVal(0)
  
  observeEvent(input$submit1,
  {req(input$qone)
    newscore<- if(input$qone=="q1b"){score() +1} else{score()}
  score(newscore)
})

  observeEvent(input$submit2,
               {req(input$qtwo)
                 newscore<- if(input$qtwo=="q2c"){score() +1} else{score()}
               score(newscore)
               })
  
  observeEvent(input$submit3,
               {req(input$qthree)
                 newscore<- if(input$qthree=="q3a"){score() +1} else{score()}
               score(newscore)
               })
  
  observeEvent(input$submit4,
               {req(input$qfour)
                 newscore<- if(input$qfour=="q4b"){score() +1} else{score()}
               score(newscore)
               })
  
  observeEvent(input$submit5,
               {req(input$qfive)
                 newscore<- if(input$qfive=="q5a"){score() +1} else{score()}
               score(newscore)
               })

output$score1 <- renderValueBox({valueBox(paste(score()),subtitle="Score")})

output$score2 <- renderValueBox({valueBox(paste(score()),subtitle="Score")})
#For some reason R shiny doesn't like outputting the score twice, so defined
#two different scores for different colour output

output$scorecolour <- renderText({
  if(score() >= 4) {
    "TRUE"
    }
  else {
    "FALSE"
  }
})
outputOptions(output, "scorecolour", suspendWhenHidden=FALSE)


})

shinyApp(ui,server)

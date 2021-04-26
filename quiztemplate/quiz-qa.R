#This notebook creates a shiny app with a quiz for the How To QA document

## Loading Libraries Needed
library(shiny)
library(tidyverse)
library(shinythemes) #theme -> css
library(shinydashboard)
library(shinyWidgets)

## --- UI --- 

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
    condition = ("input.submit2 != 1"),#Submit button is hidden once "Submit" is hit
  actionButton('submit2', label = "Submit")),
  br(),
  textOutput('textquestion2'),#Displays "Correct" or "Incorrect" text
  br(),
  textOutput('answerquestion2'),#Provides more feedback if question is incorrect
  br(),
  conditionalPanel(
    condition = ("input.submit2 != 0"),#Next Question button only displayed after answer submitted
    actionButton('next2', label = "Next Question"))),
  
  ## --- Question Three -------------------------------------------------------
  
  conditionalPanel(
    #Only show panel after Next has been hit for Q2, before Next has been hit for Q3
    condition = ("input.next2 != 0 && input.next3 != 1"),  
  fluidRow(column(12,uiOutput("questionthreeanswers")
  )
  ),
  conditionalPanel(
    condition = ("input.submit3 != 1"),#Submit button is hidden once "Submit" is hit
  actionButton('submit3', label = "Submit")),
  br(),
  textOutput('textquestion3'),#Displays "Correct" or "Incorrect" text
  br(),
  textOutput('answerquestion3'),#Provides more feedback if question is incorrect
  br(),
  conditionalPanel(
    condition = ("input.submit3 != 0"),#Next Question button only displayed after answer submitted
    actionButton('next3', label = "Next Question"))),

  ## --- Question Four --------------------------------------------------------
  
  conditionalPanel(
    #Only show panel after Next has been hit for Q3, before Next has been hit for Q4
    condition = ("input.next3 != 0 && input.next4 != 1"),    
  fluidRow(column(12,uiOutput("questionfouranswers")
  )
  ),
  conditionalPanel(
    condition = ("input.submit4 != 1"),#Submit button is hidden once "Submit" is hit
  actionButton('submit4', label = "Submit")),
  br(),
  textOutput('textquestion4'),#Displays "Correct" or "Incorrect" text
  br(),
  textOutput('answerquestion4'),#Provides more feedback if question is incorrect
  br(),
  conditionalPanel(
    condition = ("input.submit4 != 0"),#Next Question button only displayed after answer submitted
    actionButton('next4', label = "Next Question"))),
  
  ## --- Question Five --------------------------------------------------------
  conditionalPanel(
    #Only show panel after Next has been hit for Q4, before Next has been hit for Q5
    condition = ("input.next4 != 0 && input.next5 != 1"),    
    fluidRow(column(12,uiOutput("questionfiveanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit5 != 1"),#Submit button is hidden once "Submit" is hit
      actionButton('submit5', label = "Submit")),
    br(),
    textOutput('textquestion5'),#Displays "Correct" or "Incorrect" text
    br(),
    textOutput('answerquestion5'),#Provides more feedback if question is incorrect
    br(),
    conditionalPanel(
      condition = ("input.submit5 != 0"),#Next Question button only displayed after answer submitted
      actionButton('next5', label = "Next question"))),
  
  ## --- Question Six ---------------------------------------------------------
  conditionalPanel(
    #Only show panel after Next has been hit for Q5, before Next has been hit for Q6
    condition = ("input.next5 != 0 && input.next6 != 1"),    
    fluidRow(column(12,uiOutput("questionsixanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit6 != 1"),#Submit button is hidden once "Submit" is hit
      actionButton('submit6', label = "Submit")),
    br(),
    textOutput('textquestion6'),#Displays "Correct" or "Incorrect" text
    br(),
    textOutput('answerquestion6'),#Provides more feedback if question is incorrect
    br(),
    conditionalPanel(
      condition = ("input.submit6 != 0"),#Next Question button only displayed after answer submitted
      actionButton('next6', label = "Next question"))),
  
  ## --- Question Seven --------------------------------------------------------
  conditionalPanel(
    #Only show panel after Next has been hit for Q6, before Next has been hit for Q7
    condition = ("input.next6 != 0 && input.next7 != 1"),    
    fluidRow(column(12,uiOutput("questionsevenanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit7 != 1"),#Submit button is hidden once "Submit" is hit
      actionButton('submit7', label = "Submit")),
    br(),
    textOutput('textquestion7'),#Displays "Correct" or "Incorrect" text
    br(),
    textOutput('answerquestion7'),#Provides more feedback if question is incorrect
    br(),
    conditionalPanel(
      condition = ("input.submit7 != 0"),#Next Question button only displayed after answer submitted
      actionButton('next7', label = "Next question"))),
  
  ## --- Question Eight --------------------------------------------------------
  conditionalPanel(
    #Only show panel after Next has been hit for Q7, before Next has been hit for Q8
    condition = ("input.next7 != 0 && input.next8 != 1"),    
    fluidRow(column(12,uiOutput("questioneightanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit8 != 1"),#Submit button is hidden once "Submit" is hit
      actionButton('submit8', label = "Submit")),
    br(),
    textOutput('textquestion8'),#Displays "Correct" or "Incorrect" text
    br(),
    textOutput('answerquestion8'),#Provides more feedback if question is incorrect
    br(),
    conditionalPanel(
      condition = ("input.submit8 != 0"),#Next Question button only displayed after answer submitted
      actionButton('next8', label = "Next question"))),
  
  ## --- Question Nine ---------------------------------------------------------
  conditionalPanel(
    #Only show panel after Next has been hit for Q8, before Next has been hit for Q9
    condition = ("input.next8 != 0 && input.next9 != 1"),    
    fluidRow(column(12,uiOutput("questionnineanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit9 != 1"),#Submit button is hidden once "Submit" is hit
      actionButton('submit9', label = "Submit")),
    br(),
    textOutput('textquestion9'),#Displays "Correct" or "Incorrect" text
    br(),
    textOutput('answerquestion9'),#Provides more feedback if question is incorrect
    br(),
    conditionalPanel(
      condition = ("input.submit9 != 0"),#Next Question button only displayed after answer submitted
      actionButton('next9', label = "Next question"))),
  
  ## --- Question Ten ----------------------------------------------------------
  conditionalPanel(
    #Only show panel after Next has been hit for Q9, before Next has been hit for Q10
    condition = ("input.next9 != 0 && input.next10 != 1"),    
    fluidRow(column(12,uiOutput("questiontenanswers")
    )
    ),
    conditionalPanel(
      condition = ("input.submit10 != 1"),#Submit button is hidden once "Submit" is hit
      actionButton('submit10', label = "Submit")),
    br(),
    textOutput('textquestion10'),#Displays "Correct" or "Incorrect" text
    br(),
    textOutput('answerquestion10'),#Provides more feedback if question is incorrect
    br(),
    conditionalPanel(
      condition = ("input.submit10 != 0"),#Get score button only displayed after answer submitted
      actionButton('next10', label = "Get score"))),
  
  ## --- Score ----------------------------------------------------------------
  
  conditionalPanel(
    #Only show panel after Get Score button has been hit
    condition = ("input.next10 != 0"),    
    fluidRow(column(4,"Your score is",
                    
             conditionalPanel( #if score is high, display in green box and give 'well done' message
               condition = ("output.scorecolour != 'FALSE'"),
               fluidRow(column(6,
                               uiOutput("score1",style="Background-color: #d4f7d2;"))),
               fluidRow(column(12,"Nice work, well done!"))),
             
             conditionalPanel( #if score is low, display in red box and give 'try harder' message
               condition = ("output.scorecolour != 'TRUE'"),
               fluidRow(column(6,
                               uiOutput("score2",style="Background-color: #f7e1e1;"))),
               fluidRow(column(12,"Revisit some of the earlier topics and try the quiz again."))),
    )
    ),
  ),
  
  br()
  
))


## --- SERVER -----------------------------------------------------------------

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
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                  no = icon("remove", lib = "glyphicon")), #Cross if option not selected
                 direction = "vertical")#Options displayed vertically
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
                 selected=character(0),#No initial selection
                 status = "primary",#This is the style/colour of the radioGroupButtons
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"),#Tick if option selected
                                  no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                 direction = "vertical")#Options displayed vertically
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
                 selected=character(0),#No initial selection
                 status = "primary",#This is the style/colour of the radioGroupButtons
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"),#Tick if option selected
                                  no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                 direction = "vertical")#Options displayed vertically
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
                 selected=character(0),#No initial selection
                 status = "primary",#This is the style/colour of the radioGroupButtons
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                  no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                 direction = "vertical")#Options displayed vertically
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
                 selected=character(0),#No initial selection
                 status = "primary",#This is the style/colour of the radioGroupButtons
                 checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                  no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                 direction = "vertical")#Options displayed vertically
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
  
  ## --- Question Six ---------------------------------------------------------
  
  #Question and answers. Correct answer = q6a
  output$questionsixanswers <- renderUI({
    radioGroupButtons("qsix", "6. What's the answer?", 
                      c("Correct"="q6a", 
                        "Incorrect"="q6b", 
                        "Incorrect"="q6c", 
                        "Incorrect"="q6d"), 
                      selected=character(0),#No initial selection
                      status = "primary",#This is the style/colour of the radioGroupButtons
                      checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                       no= icon("remove", lib = "glyphicon")),#Cross if option not selected
                      direction = "vertical")#Options displayed vertically
  })
  #Responses to answer
  observe({ 
    input$submit6 
    isolate( textquestion6 <- if_else(input$qsix == "q6a", paste("Correct!"),
                              if_else(input$qsix == "q6b", paste("Incorrect."),
                              if_else(input$qsix == "q6c", paste("Incorrect."),
                              paste("Incorrect.")))))
    output$textquestion6 <- renderText({textquestion6})
  })
  #Explanation of correct answer
  observe({ 
    input$submit6 
    isolate( answerquestion6 <- if_else(input$qsix == "q6a", paste(""), paste("The correct answer was the one that said correct.")))
    output$answerquestion6 <- renderText({answerquestion6})
  })
  
  ## --- Question Seven -------------------------------------------------------
  
  #Question and answers. Correct answer = q7a
  output$questionsevenanswers <- renderUI({
    radioGroupButtons("qseven", "7. What's the answer?", 
                      c("Correct"="q7a", 
                        "Incorrect"="q7b", 
                        "Incorrect"="q7c", 
                        "Incorrect"="q7d"), 
                      selected=character(0),#No initial selection
                      status = "primary",#This is the style/colour of the radioGroupButtons
                      checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                       no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                      direction = "vertical")#Options displayed vertically
  })
  #Responses to answer
  observe({ 
    input$submit7 
    isolate( textquestion7 <- if_else(input$qseven == "q7a", paste("Correct!"),
                                      if_else(input$qseven == "q7b", paste("Incorrect."),
                                              if_else(input$qseven == "q7c", paste("Incorrect."),
                                                      paste("Incorrect.")))))
    output$textquestion7 <- renderText({textquestion7})
  })
  #Explanation of correct answer
  observe({ 
    input$submit7
    isolate( answerquestion7 <- if_else(input$qseven == "q7a", paste(""), paste("The correct answer was the one that said correct.")))
    output$answerquestion7 <- renderText({answerquestion7})
  })
  
  ## --- Question Eight -------------------------------------------------------
  
  #Question and answers. Correct answer = q8a
  output$questioneightanswers <- renderUI({
    radioGroupButtons("qeight", "8. What's the answer?", 
                      c("Correct"="q8a", 
                        "Incorrect"="q8b", 
                        "Incorrect"="q8c", 
                        "Incorrect"="q8d"), 
                      selected=character(0),#No initial selection
                      status = "primary",#This is the style/colour of the radioGroupButtons
                      checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                       no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                      direction = "vertical")#Options displayed vertically
  })
  #Responses to answer
  observe({ 
    input$submit8 
    isolate( textquestion8 <- if_else(input$qeight == "q8a", paste("Correct!"),
                                      if_else(input$qeight == "q8b", paste("Incorrect."),
                                              if_else(input$qeight == "q8c", paste("Incorrect."),
                                                      paste("Incorrect.")))))
    output$textquestion8 <- renderText({textquestion8})
  })
  #Explanation of correct answer
  observe({ 
    input$submit8
    isolate( answerquestion8 <- if_else(input$qeight == "q8a", paste(""), paste("The correct answer was the one that said correct.")))
    output$answerquestion8 <- renderText({answerquestion8})
  })
  
  ## --- Question Nine -------------------------------------------------------
  
  #Question and answers. Correct answer = q9a
  output$questionnineanswers <- renderUI({
    radioGroupButtons("qnine", "9. What's the answer?", 
                      c("Correct"="q9a", 
                        "Incorrect"="q9b", 
                        "Incorrect"="q9c", 
                        "Incorrect"="q9d"), 
                      selected=character(0),#No initial selection
                      status = "primary",#This is the style/colour of the radioGroupButtons
                      checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                       no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                      direction = "vertical")#Options displayed vertically
  })
  #Responses to answer
  observe({ 
    input$submit9 
    isolate( textquestion9 <- if_else(input$qnine == "q9a", paste("Correct!"),
                                      if_else(input$qnine == "q9b", paste("Incorrect."),
                                              if_else(input$qnine == "q9c", paste("Incorrect."),
                                                      paste("Incorrect.")))))
    output$textquestion9 <- renderText({textquestion9})
  })
  #Explanation of correct answer
  observe({ 
    input$submit9
    isolate( answerquestion9 <- if_else(input$qnine == "q9a", paste(""), paste("The correct answer was the one that said correct.")))
    output$answerquestion9 <- renderText({answerquestion9})
  })
  
  ## --- Question Ten -------------------------------------------------------
  
  #Question and answers. Correct answer = q10a
  output$questiontenanswers <- renderUI({
    radioGroupButtons("qten", "10. What's the answer?", 
                      c("Correct"="q10a", 
                        "Incorrect"="q10b", 
                        "Incorrect"="q10c", 
                        "Incorrect"="q10d"), 
                      selected=character(0),#No initial selection
                      status = "primary",#This is the style/colour of the radioGroupButtons
                      checkIcon = list(yes = icon("ok", lib = "glyphicon"), #Tick if option selected
                                       no = icon("remove", lib = "glyphicon")),#Cross if option not selected
                      direction = "vertical")#Options displayed vertically
  })
  #Responses to answer
  observe({ 
    input$submit10 
    isolate( textquestion10 <- if_else(input$qten == "q10a", paste("Correct!"),
                                      if_else(input$qten == "q10b", paste("Incorrect."),
                                              if_else(input$qten == "q10c", paste("Incorrect."),
                                                      paste("Incorrect.")))))
    output$textquestion10 <- renderText({textquestion10})
  })
  #Explanation of correct answer
  observe({ 
    input$submit10
    isolate( answerquestion10 <- if_else(input$qten == "q10a", paste(""), paste("The correct answer was the one that said correct.")))
    output$answerquestion10 <- renderText({answerquestion10})
  })
  
  ## --- What's your score? ---------------------------------------------------
  
  #Correct answers are q1b, q2c, q3a, q4b, q5a, q6a, q7a, q8a, q9a, q10a
  score <- reactiveVal(0)#score initially set to zero
  
  observeEvent(input$submit1,
  {req(input$qone)
    newscore<- if(input$qone=="q1b"){score() +1} else{score()}#score increases by 1 if answer correct
  score(newscore)
})

  observeEvent(input$submit2,
               {req(input$qtwo)
                 newscore<- if(input$qtwo=="q2c"){score() +1} else{score()}#score increases by 1 if answer correct
               score(newscore)
               })
  
  observeEvent(input$submit3,
               {req(input$qthree)
                 newscore<- if(input$qthree=="q3a"){score() +1} else{score()}#score increases by 1 if answer correct
               score(newscore)
               })
  
  observeEvent(input$submit4,
               {req(input$qfour)
                 newscore<- if(input$qfour=="q4b"){score() +1} else{score()}#score increases by 1 if answer correct
               score(newscore)
               })
  
  observeEvent(input$submit5,
               {req(input$qfive)
                 newscore<- if(input$qfive=="q5a"){score() +1} else{score()}#score increases by 1 if answer correct
               score(newscore)
               })
  
  observeEvent(input$submit6,
               {req(input$qsix)
                 newscore<- if(input$qsix=="q6a"){score() +1} else{score()}#score increases by 1 if answer correct
                 score(newscore)
               })
  
  observeEvent(input$submit7,
               {req(input$qseven)
                 newscore<- if(input$qseven=="q7a"){score() +1} else{score()}#score increases by 1 if answer correct
                 score(newscore)
               })
  
  observeEvent(input$submit8,
               {req(input$qeight)
                 newscore<- if(input$qeight=="q8a"){score() +1} else{score()}#score increases by 1 if answer correct
                 score(newscore)
               })
  
  observeEvent(input$submit9,
               {req(input$qnine)
                 newscore<- if(input$qnine=="q9a"){score() +1} else{score()}#score increases by 1 if answer correct
                 score(newscore)
               })
  
  observeEvent(input$submit10,
               {req(input$qten)
                 newscore<- if(input$qten=="q10a"){score() +1} else{score()}#score increases by 1 if answer correct
                 score(newscore)
               })

output$score1 <- renderValueBox({valueBox(paste(score()*10, "%"),subtitle="Score percentage")}) #Outputs score as a percentage

output$score2 <- renderValueBox({valueBox(paste(score()*10, "%"),subtitle="Score percentage")})
#For some reason R shiny doesn't like outputting the same score twice, so defined
#two different scores for different colour output

output$scorecolour <- renderText({ #if score is seven or higher, display in a green box. Otherwise red
  if(score() >= 7) {
    "TRUE"
    }
  else {
    "FALSE"
  }
})
outputOptions(output, "scorecolour", suspendWhenHidden=FALSE)


})

## --- BUILD APP --------------------------------------------------------------

shinyApp(ui,server)

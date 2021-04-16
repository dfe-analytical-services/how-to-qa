questionserver <- function(number = 1,
                     ask = "Your question",
                     answer = c("Your answers"),
                     correct = "correct"){
  
  radioButtons(inputnum, ask, answer, selected=character(0))
  
  observe({ 
    input$submit1 
    isolate( textquestion <- if_else(input$inputnum == correct, paste("You've answered the question correctly."), paste("You've answered the question incorrectly.")))
    output$textquestion <- renderText({textquestion})
  })
  
}


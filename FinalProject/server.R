library(shiny)
data(swiss)
shinyServer(
      function(input,output){
            output$Ans <- renderPrint({
                  input$goButton
                  rm(list=ls())
                  parms <- as.list(input$id1)
                  if (length(parms) == 5) {
                        model<-lm(Examination~.,data=swiss)
                  } else if (length(parms) == 4){
                        model<-lm(paste("Examination~",parms[[1]],"+",parms[[2]],"+",parms[[3]],"+",parms[[4]],sep=""),data=swiss)
                  } else if (length(as.list(input$id1)) == 3){
                        model<-lm(paste("Examination~",parms[[1]],"+",parms[[2]],"+",parms[[3]],sep=""),data=swiss)
                  } else if (length(as.list(input$id1)) == 2){
                        model<-lm(paste("Examination~",parms[[1]],"+",parms[[2]],sep=""),data=swiss)
                  } else if (length(parms) == 1){
                        model<-lm(paste("Examination~",parms[[1]],sep=""),data=swiss)
                  }
                  
                  #length(input$id1) == 1
                  #class(as.list(input$id1))
                  #input$id1[[1]]
                  #parms[[1]]
                  summary(model)
            })
            #output$summary <- renderPrint({class(input)})
      }
)
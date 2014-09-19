# Coursera course: Developing Data products
# Date: 17-09-2014
# Made by: WWL

library(shiny)
data(mtcars)

shinyServer(function(input, output, session) {
  
  selectedData <- reactive({ mtcars[mtcars$am==input$chooseTrans & mtcars$mpg>=input$chooseMPG[1]
                                  & mtcars$mpg<=input$chooseMPG[2], input$viewVar] })
  
  output$plot1 <- renderPlot({
    
    par(mar=c(10,3,1,1)+0.1)
     
    plot(selectedData(), col = "red", pch = 16, cex = 1.5, las=1, xlab="", ylab="", xaxt="n")
        
    axis(labels=row.names(mtcars[mtcars$am==input$chooseTrans & mtcars$mpg>=input$chooseMPG[1] & mtcars$mpg<=input$chooseMPG[2], ]), 
         at= 1:as.numeric(nrow(mtcars[mtcars$am==input$chooseTrans & mtcars$mpg>=input$chooseMPG[1]
                                      & mtcars$mpg<=input$chooseMPG[2], ])), side=1, las=2)
    })
  

})

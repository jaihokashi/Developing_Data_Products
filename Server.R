library(shiny)

data(mtcars)

shinyServer( 
        function(input, output) {
                xvarInput <- reactive({
                        switch(input$xvariable,
                               "Weight"=mtcars$wt,
                               "Cylinders"=mtcars$cyl,
                               "Horsepower"=mtcars$hp,
                               "Transmission"=mtcars$am)
                })
                output$newPlot <- renderPlot({
                        plot(xvarInput(), mtcars$mpg, main = paste(input$xvariable, "MPG", sep=" vs. "), cex=1.5, pch="*", col = (c("red","blue")), xlab = input$xvariable, ylab = "MPG")
                        legend("topright", c(input$xvariable, "MPG"), lty=c(1,1), lwd=c(2.5,2.5),col=c("red","blue"))
                        if(input$reglinecheck) {
                                abline(lm(mtcars$mpg ~ xvarInput()), col="green")                                
                        }
                }) 
        }
)
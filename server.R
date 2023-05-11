#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)

# Define server logic required to draw a histogram
shinyServer(function(input,output) {

  model <- train(price~as.numeric(carat)+as.factor(cut)+as.factor(color), diamonds, method ='glm')

 x<-  reactive({predict(model,newdata = data.frame(carat=as.factor(input$carat),
                                                   color=as.factor(input$color),cut=as.factor(input$cut)))})

 output$text <- renderText(x())
})
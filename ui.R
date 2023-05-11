#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Diamond Price Prediction Tool"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          selectInput("color",
                        "What is the Colour of the Diamond (D is worst J is best)",
                       choices = c('D','E','F','G','H','I','J') ),
        numericInput("carat", "How many Carats is the Diamond?", value = 0.2,min =  0.2,max =  5.1,step =  0.01),
        selectInput("cut",
                    "What is the cut of the Diamond",
                    choices = c('Fair', 'Good', 'Very Good', 'Premium', 'Ideal')),
        submitButton('Predict Diamond Price')
    ),
            
    # Show a plot of the generated distribution
    mainPanel(
    h1("Use this app to predict the price of your diamond!"),
    h3("How to use this app:"),
    h4("Select the colour, carat and cut of your diamond from the pannel on the left.
       Once you're ready click 'Predict Diamond Price' and the ouput will be shown below" ),
    h4('Predicted diamond price:'),
    textOutput('text')
          
    )
    )
)


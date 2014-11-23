library(shiny)

shinyUI( 
        pageWithSidebar(
                # Application title 
                headerPanel("Plotting Cars Dataset."),
                sidebarPanel(
                        selectInput('xvariable', 'Choose a variable:', c("Weight", "Cylinders","Horsepower", "Transmission"), selected = "mtcars$wt"),
                        checkboxInput('reglinecheck',"Include Regression line?:"),
                        submitButton('Submit')
                ),
                mainPanel(
                        p("Choose the option from dropdown list to plotted on the x-axis. Please select the checkbox if you wish to include regression line."),
                        plotOutput("newPlot")
                ) 
        )
)
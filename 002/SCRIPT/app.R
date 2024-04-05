#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("R INICIAL"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      
      # --------------------------------------------------------------1er input
        sidebarPanel(
            selectInput( inputId = "var",
                         label = "Variable seleccionada:",
                         selected = names(Data_Banco)[1],
                         choices =  names(Data_Banco))
        ),
      # --------------------------------------------------------------2do input
      #h6("Shiny:", align = "center"), 
        

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           p("Seleccionamos una variable desde un selectinput",
             style = "font-family: 'times'; font-si16pt" ),
           textOutput("variable_1"),br(),
           p("Hacemos una tabla de resumen: "),br(),
           tableOutput("tabla_1")
        )
    )
)




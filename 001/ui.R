#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
          #--------------------------------------------------
          selectInput(
            inputId = "var",
            label = "Selecciona la variable: ",
            choices = names(mtcars),
            selected = "wt"
          ),
          #--------------------------------------------------
          radioButtons("Tema",
                       "Elige tu estilo de ggplot",
                       choices = c("Default","Clasico","B/N"),
                       selected = "Clasico"
          ),
          #--------------------------------------------------
          selectInput(
            inputId = "cilindros",
            label = "Selecciona un número: ",
            choices = unique(mtcars$cyl),
            selected = 1,
            multiple = TRUE
          ),
          #--------------------------------------------------
          radioButtons("reg_si_no",
                       "Quieres hacer una regresión: ",
                       choices = c("Si","No"),
                       selected = "No"
          ),
          #--------------------------------------------------
          
        ), #fin sidebarpanel

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("carplot"),
           dataTableOutput("cartabla")
        )
    )
)

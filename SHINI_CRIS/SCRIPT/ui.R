library(shinydashboard)
library(plotly)
library(rio)
library(knitr)
library(ggplot2)
library(tidyverse)
library(shiny)

#emp_upm <- import("ind_upm.rds")
#emp_HI <- import("ind_HI.rds")

ui <- dashboardPage(
  dashboardHeader(title = "Indicadores"),
  dashboardSidebar(
    sidebarMenu(
      # ------------------------------------------------------------------------- PESTAÑA 1
      menuItem("Pestaña",
               selectizeInput(
                 label = "",
                 inputId = "variable",
                 choices = (unique(emp_HI$tipo)),
                 selected = "Abilene",
                 multiple = FALSE
               )
               ),
      # ------------------------------------------------------------------------- PESTAÑA 2
      menuItem("Empleo adecuado", tabName = "emp_ade",
               
               selectizeInput(
                 label = "",
                 inputId = "variable",
                 choices = (unique(emp_HI$tipo)),
                 selected = "Abilene",
                 multiple = FALSE
               ),
               
               selectizeInput(
                 label = "",
                 inputId = "cities",
                 choices = unique(emp_upm$rep),
                 selected = "Abilene",
                 multiple = TRUE
               ),
               
               radioButtons("graf_si_no",
                            "Grafico: ",
                            choices = c("Si","No"),
                            selected = "Si"
               )
               
      )
    )
    
    
  ),
  dashboardBody(
    
    tabItem(tabName = "des",
            fluidRow(
              box(title = "UPM",
                  plotlyOutput(outputId = "p")),
              box(title = "Hogar Integrado",
                  plotlyOutput(outputId = "p1"))
            )
    )
    
  )#fin
)

shinyApp(ui, server)






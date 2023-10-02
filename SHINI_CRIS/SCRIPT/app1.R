library(shinydashboard)
library(plotly)
library(rio)
library(knitr)
library(ggplot2)
library(tidyverse)

#emp_upm <- import("ind_upm.rds")
#emp_HI <- import("ind_HI.rds")

ui <- dashboardPage(
  
  dashboardHeader(title = "Indicadores"),
  dashboardSidebar(
    sidebarMenu(
      
      menuItem("Variable", tabName = "emp_ade",

               selectizeInput(
                 label = "",
                 inputId = "variable",
                 choices = (unique(emp_HI$tipo)),
                 selected = "NULL",
                 multiple = FALSE)
               ),
      
      menuItem("Dominio",
               selectizeInput(
                 label = "",
                 inputId = "cities",
                 choices = unique(emp_upm$rep),
                 selected = "Nacional",
                 multiple = TRUE)
               )
    )
  ),
  
  dashboardBody(
   # tabItems(
      #Empleo adecuado
      tabItem(tabName = "des",
        fluidRow(
          box(title = "UPM",
              plotlyOutput(outputId = "p")),
          box(title = "Hogar Integrado",
              plotlyOutput(outputId = "p1"))
        )
      ),
      tabItem(tabName = "des")
  #  )
  )
)

# -------------------------------------------------------------------------
# SERVER ------------------------------------------------------------------
# -------------------------------------------------------------------------

server <- function(input, output) {
  output$p <- renderPlotly({
    plot_ly(emp_upm, x = ~x, y = ~tasas, color = ~rep, mode = "lines+markers") %>%
      filter(tipo == as.character( input$variable) ) %>% 
      filter(rep %in% input$cities) %>%
      group_by(rep) %>%
      add_lines() 
    })

  output$p1 <- renderPlotly({
    plot_ly(emp_HI, x = ~x, y = ~tasas, color = ~rep, mode = "lines+markers") %>%
      filter(tipo == as.character( input$variable) ) %>%
      filter(rep%in% input$cities) %>%
      group_by(rep) %>%
      add_lines()
  })

}

# -------------------------------------------------------------------------
# APP--- ------------------------------------------------------------------
# -------------------------------------------------------------------------

shinyApp(ui, server)

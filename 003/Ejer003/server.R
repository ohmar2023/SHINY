#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # REACTIVO ---------------------------------------------------------------  
  base <- reactive({Data_Banco })
  
  source("serv/graf_1.R", local = T)
  # SALIDA GRAFICO ---------------------------------------------------------  
  

  # SALIDA EN TEXTO 1 -------------------------------------------------------
  output$variable_1 <- renderText({
    print(input$var)
  })
  
  # SALIDA EN TEXTO 2 -------------------------------------------------------
  output$variable_2 <- renderText({
    print(input$obs)
  })
  
  # SALIDA EN TEXTO 3 ------------------------------------------------------- 
  output$tabla_1 <- renderTable({
    Data_Banco %>% group_by(.data[[input$var]]) %>% summarise(n = n()) 
  })
  
  
  # DIAGRAMA DE CAJAS ------------------------------------------------------- 
  output$grafico_caja <- renderPlot({
    #boxplot(Data_Banco$Monto)  
    ggplot(Data_Banco,aes(x = .data[[input$var]],y = Monto))+
      stat_boxplot(geom = "errorbar", # Bigotes
                   width = 0.2) +
      geom_boxplot(fill = "#4271AE", colour = "#1F3552", # Colores
                   alpha = 0.9, outlier.colour = "red")
  })

})

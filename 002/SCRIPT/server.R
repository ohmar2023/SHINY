
# Define server logic required to draw a histogram
server <- function(input, output) {

# SALIDA GRAFICO ---------------------------------------------------------  
  output$distPlot <- renderPlot({
    ggplot(Data_Banco, aes(y = Monto, x = Sucursal,fill= Sucursal )) +
      geom_bar(width = 0.5, stat="identity", position = position_dodge())
  })
  
# SALIDA EN TEXTO 1 -------------------------------------------------------
 output$variable_1 <- renderText({
   print(input$var)
 })
 
 # SALIDA EN TEXTO 1 ------------------------------------------------------- 
 output$tabla_1 <- renderTable({
   Data_Banco %>% group_by_(input$var) %>% summarise(n = n()) 
 })
 
}

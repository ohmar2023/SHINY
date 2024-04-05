
# Define server logic required to draw a histogram
server <- function(input, output) {

# SALIDA GRAFICO ---------------------------------------------------------  
  output$distPlot <- renderPlot({
    ggplot(Data_Banco, aes(x = as.character(Sucursal),y=Cajero,fill=as.character(Sucursal)))  +
      geom_bar(width = 0.9, stat="identity",position = position_dodge())
  })
  
# SALIDA EN TEXTO 1 -------------------------------------------------------
 output$variable_1 <- renderText({
   print(input$var)
 })
 
 # SALIDA EN TEXTO 1 ------------------------------------------------------- 
 output$tabla_1 <- renderTable({
   Data_Banco %>% group_by(.data[[input$var]]) %>% summarise(n = n()) 
 })
 
}

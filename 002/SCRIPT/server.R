
# Define server logic required to draw a histogram
server <- function(input, output) {
  

# REACTIVO ---------------------------------------------------------------  
  base <- reactive({Data_Banco })
  
# SALIDA GRAFICO ---------------------------------------------------------  
  output$distPlot <- renderPlot({
    ggplot(Data_Banco, aes(x = .data[[input$var]],y=Cajero,fill=as.character(Sucursal)))  +
      geom_bar(width = 0.9, stat="identity",position = position_dodge())
  })
  
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
 
}

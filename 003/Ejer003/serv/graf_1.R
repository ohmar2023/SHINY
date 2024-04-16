# SALIDA GRAFICO ---------------------------------------------------------  
output$distPlot <- renderPlot({
  ggplot(Data_Banco, aes(x = .data[[input$var]],y=Cajero,fill=as.character(Sucursal)))  +
    geom_bar(width = 0.9, stat="identity",position = position_dodge())
})

#source("ui_sr/sr_cns_01_var_sexo_fecha.R", local = T)
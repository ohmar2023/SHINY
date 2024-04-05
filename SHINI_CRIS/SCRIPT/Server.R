emp_upm <- import("ind_upm.rds")

emp_HI <- import("ind_HI.rds")


server <- function(input, output) {
  output$p <- renderPlotly({
<<<<<<< HEAD
    
   
      plot_ly(emp_upm, x = ~x, y = ~tasas, color = ~rep, mode = "lines+markers") %>%
        filter(tipo == as.character( input$variable) ) %>% 
        filter(rep %in% input$cities) %>%
        group_by(rep) %>%
        add_lines()
    
  
=======
    plot_ly(emp_upm, x = ~x, y = ~tasas, color = ~rep, mode = "lines+markers") %>%
      filter(tipo == as.character(input$variable)) %>% 
      filter(rep %in% input$cities) %>%
      group_by(rep) %>%
      add_lines()
>>>>>>> 5f3f91ae37928c8f7a6f41a8d72a5437980f0e10
  })
  
  output$p1 <- renderPlotly({
    if(input$graf_si_no=="Si"){
    plot_ly(emp_HI, x = ~x, y = ~tasas, color = ~rep, mode = "lines+markers") %>%
      filter(tipo == as.character( input$variable) ) %>%
      filter(rep%in% input$cities) %>%
      group_by(rep) %>%
      add_lines()
    }
  })
  

}

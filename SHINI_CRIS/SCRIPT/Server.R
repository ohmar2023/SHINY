emp_upm <- import("ind_upm.rds")

emp_HI <- import("ind_HI.rds")


server <- function(input, output) {
  output$p <- renderPlotly({
    plot_ly(emp_upm, x = ~x, y = ~tasas, color = ~rep, mode = "lines+markers") %>%
      filter(tipo == as.character(input$variable)) %>% 
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
  
  output$r_si_no <- renderUI({
    if (input$graf_si_no=="Si"){
      textInput("Formula",
                "Escribe una fórmula:",
                "y~x")}
  })
}

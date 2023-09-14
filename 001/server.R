library(ggplot2)
library(dplyr)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  #REACTIVOS -------------------------------------------------------------------
  mt <- reactive({
    mtcars %>% filter(cyl %in% input$cilindros)
  })
  #-----------------------------------------------------------------------------
  output$carplot <- renderPlot({
    g <- ggplot(mt(),aes_string(x=input$var,y="mpg"))+geom_point()
    
    if (input$reg_si_no=="Si")
    {
      g <- g + stat_smooth(method = "lm",formula = input$Formula)
    }
      
    if (input$Tema=="Clasico")
    {
      g + theme_classic()
    }
    else if(input$Tema=="B/N")
    {
      g + theme_bw()
    }
    else
    {
      g
    }
    })
  #-----------------------------------------------------------------------------
  output$cartabla <- renderDataTable({
    mt()
  })
  #-----------------------------------------------------------------------------
  output$reg_Si_no <- renderUI({
    if (input$reg_si_no=="Si"){
      textInput("Formula",
                "Escribe una fórmula:",
                "y~x")}
  })
  #-----------------------------------------------------------------------------
  }


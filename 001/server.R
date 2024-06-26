library(ggplot2)
library(dplyr)
library(dplyr)
library(broom)#glance
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  #REACTIVOS -------------------------------------------------------------------
  mt <- reactive({
    mtcars %>% filter(cyl %in% input$cilindros)
  })
  #-----------------------------------------------------------------------------
  output$carplot <- renderPlot({
    g <- ggplot(mt(),aes(x=input$var,y=mpg))+geom_point()
    
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
    fit <- lm(as.formula(input$Modelo),data=mt())
    glance(fit) %>% mutate_if(is.numeric,~round(.x,2))
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



ui <- fluidPage(

  #theme=shinytheme("cerulean"),
  #collapsible = TRUE,
    # Application title
    titlePanel("R INICIAL"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      
      # --------------------------------------------------------------1er input
        sidebarPanel(
            selectInput( inputId = "var",
                         label = "Variable seleccionada:",
                         selected = names(Data_Banco)[1],
                         choices =  names(Data_Banco %>% select_if(is.character))),
      # --------------------------------------------------------------2do input     
            sliderInput("obs", 
                        "Rango-Monto:",
                        min = min(Data_Banco$Monto,na.rm = TRUE),
                        max = max(Data_Banco$Monto,na.rm = TRUE),
                        animate = TRUE,
                        value = c(min(Data_Banco$Monto,na.rm = TRUE),
                                  max(Data_Banco$Monto,na.rm = TRUE))
            )
        ),
      

        mainPanel(
           plotOutput("distPlot"),
           p("Seleccionamos una variable desde un selectinput",
             style = "font-family: 'times'; font-si16pt" ),
           textOutput("variable_1"),br(),
           textOutput("variable_2"),br(),
           p("Hacemos una tabla de resumen: "),br(),
           tableOutput("tabla_1"),br(),
           plotOutput("grafico_caja")
        )
    )
)




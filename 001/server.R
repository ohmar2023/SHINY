library(ggplot2)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  #-----------------------------------------------------------------------------
  output$carplot <- renderPlot({
    g <- ggplot(mtcars,aes_string(x=input$var,y="mpg"))+geom_point()
    g })
  #-----------------------------------------------------------------------------
  output$cartabla <- renderDataTable({
    mtcars
  })
  #-----------------------------------------------------------------------------
  }


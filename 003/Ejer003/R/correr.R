# Run the application 
#shinyApp(ui = ui, server = server)


# LEER BASE ---------------------------------------------------------------

library(shiny)
library(readxl)
library(tidyverse)
library(ggplot2)
library(shinythemes)
library(janitor)

Data_Banco <- read_excel("DATA/Data_Banco.xlsx", 
                         sheet = "Data") %>% mutate(Monto = as.numeric(Monto))








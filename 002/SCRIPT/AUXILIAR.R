# TEXTO EN SHINY

# 
# strong("strong() texto en negrita."),  br(),
# em("em() texto en cursiva."), br(),
# code("code() texto subrallado similar al de la computadora"),
# div("div() segmentos de texto con estilo similar y se puede 
#           cambiar de color con: 'style = color:blue' ",
#     style = "color:blue"), br(),
# p("span() es igual a div(), pero trabaja en",
#   span("grupos de palabras", style = "color:orange"),
#   "que pueden estar dentro de u párrafo.") , br(),
# 
# 
# 

ej <- "Sucursal"
Data_Banco %>% group_by_at(ej) %>% summarise(n = n()) %>% View()



# ADORN TOTALS ------------------------------------------------------------

some_df <- data.frame( drug = rep(c('A','B', 'C'), 2),
                       year =  rep(c(2016, 2017), 3),
                       patients = sample(5:100, 6))

some_df %>% adorn_totals("col",,,,-drug,-patients)

some_df %>% adorn_totals(c("col","row"))


# BASE PABLO --------------------------------------------------------------

db_2 <- unzip("DATA/bases_ENEMDU_2024_03.zip")
import(db_2[2])
library(rio)












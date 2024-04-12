library(tidyverse)

# creating a data frame
df<-data.frame(Creature=c('Starfish','Blue Crab','Bluefin Tuna','Blue Shark','Blue Whale'),Population=c(5,6,4,2,2))

# data frame
df

names(df)
df %>% mutate(
hola = grepl(df$Creature, pattern = "Bl&ta","xxxx" ))








getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap15/Projeto")

# Carrega o dataset 
?read.csv
df <- read.csv('credito.csv', stringsAsFactors = TRUE )
View(df)
str(df)
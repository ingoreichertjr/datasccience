# Manipulando os dados com tidyr

getwd()

install.packages('dplyr')
install.packages('tidyr')
library(dplyr)
library(tidyr)

df <- read.csv('BankChurners.csv')
View(df)
dim(df)
str(df)

df2 <- data.frame(df)

df2 %>%
  select(Customer_Age, Marital_Status, Card_Category) %>%
  head()

df %>%
  gather(Sexo, Gender, Card_Category) %>%
  head()

df %>%
  separate(Income_Category, into = c('minimo', 'maximo'),  sep = '\\-') %>%
  select(minimo, maximo) %>%
  head()
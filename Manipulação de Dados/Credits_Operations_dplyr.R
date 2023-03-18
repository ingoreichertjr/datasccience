# Treinando os pacote dplyr

getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap07/Prática")

install.packages('dplyr')
library(dplyr)

df <- read.csv('BankChurners.csv')
View(df)
dim(df)
str(df)

# Manipulando o dataframe

# Utilizando o select para selecionar apenas as colunas que eu quero
??select
names(df)


df2 <- select(df, -Total_Relationship_Count, -Months_Inactive_12_mon, -Contacts_Count_12_mon, 
         -Avg_Open_To_Buy, -Total_Amt_Chng_Q4_Q1, -Total_Trans_Ct, -Total_Ct_Chng_Q4_Q1, 
         -Naive_Bayes_Classifier_Attrition_Flag_Card_Category_Contacts_Count_12_mon_Dependent_count_Education_Level_Months_Inactive_12_mon_1)
df2
View(df2)

# Utilizando o filter

df3 <- filter(df2, Total_Trans_Amt > 10000)
dim(df3)
View(df3)

# Criando uma nova coluna com a porcentagem de utilização do crédito
df3 %>%
  select(CLIENTNUM, Credit_Limit, Total_Revolving_Bal) %>%
  mutate(porcentagem_uso_credito = (Total_Revolving_Bal / Credit_Limit) * 100) %>%
  arrange(porcentagem_uso_credito) %>%
  filter(Credit_Limit > 10000 & porcentagem_uso_credito < 20)

# Pegando média de gastos de homem e mulher
df %>%
  select(Gender, Total_Revolving_Bal) %>%
  filter(Gender == 'M') %>%
  summarise(media_gastos_M = mean(Total_Revolving_Bal))
  
df %>%
  select(Gender, Total_Revolving_Bal) %>%
  filter(Gender == 'F') %>%
  summarise(media_gastos_F = mean(Total_Revolving_Bal))

# Qual cliente mais gasta no cartão e qual menos gasta
df %>%
  summarise(maior_gasto = max(Total_Revolving_Bal),
            menor_gasto = min(Total_Revolving_Bal))

# Utilizando o group by
df %>%
  group_by(Gender) %>%
  summarise(avg_gastos = mean(Total_Revolving_Bal),
            min_gastos = min(Total_Revolving_Bal),
            max_gastos = max(Total_Revolving_Bal))

df %>%
  group_by(Education_Level) %>%
  summarise(avg_gastos = mean(Avg_Open_To_Buy),
            min_gastos = min(Avg_Open_To_Buy),
            max_gastos = max(Avg_Open_To_Buy))
  
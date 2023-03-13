getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap18")

### Mini Projeto ###

## Respondendo perguntas de negócio

install.packages('sqldf')
library(sqldf)

# Leitura do arquivo
df <- read.csv('dataset.csv')
View(df)
dim(df)
str(df)

# Analisando e excluindo valores missings
colSums(is.na(df))
df <- na.omit(df)
dim(df)

# Analisando estatística descritiva dos dados
summary(df)

# Alterando os nomes das variáveis
new_colNames <- c('Idade', 'Sexo', 'Tempo_Internacao', 'Raça', 'Custo_Total', 'Grupo_Diagnostico')
colnames(df) <- new_colNames
View(df)

# Alterando a classe Custo Total
is.numeric(df$Custo_Total)
str(df)

# Analisando a quantidade de registros nas variáveis
length(unique(df$Idade))
table(df$Idade)
prop.table(table(df$Idade))

length(unique(df$Tempo_Internacao))
table(df$Tempo_Internacao)
prop.table(table(df$Tempo_Internacao))

length(unique(df$Grupo_Diagnostico))
table(df$Grupo_Diagnostico)
prop.table(table(df$Grupo_Diagnostico))

### Respondendo Pergundas de Negócio ###

## 1- Quantas raças estão representadas no dataset?

racas <- sqldf('SELECT Raça, COUNT(Raça) as num_racas FROM df 
               GROUP BY Raça')
racas

## 2- Qual a idade média dos pacientes?

idade_media <- sqldf('SELECT AVG(Idade) as idade_media FROM df')
idade_media

## 3- Qual a moda da idade dos pacientes?

moda_idade <- sqldf('SELECT Idade, COUNT(Idade) as valor_moda FROM df 
                    GROUP BY Idade
                    LIMIT 1')

moda_idade
moda_idade[1:1]

## 4- Qual a variância da coluna idade?

variancia <- sqldf('SELECT SUM((Idade - (SELECT AVG(Idade) FROM df)) * 
                  (Idade - (SELECT AVG(Idade) FROM df))) / (COUNT(Idade) -1) 
                  AS variancia FROM df')

variancia

## 5- Qual o gasto total com internações hospitalares por idade?

gasto_total_idade <- sqldf('SELECT Idade, SUM(Custo_Total) as custo_total FROM df
                           GROUP BY Idade
                           ORDER BY custo_total desc')

gasto_total_idade

## 6- Qual idade gera o maior gasto total com internações hospitalares?

gasto_total_idade[1, ]

## 7- Qual o gasto total com internações hospitalares por gênero?

gasto_total_genero <- sqldf('SELECT Sexo, SUM(Custo_Total) as custo_total FROM df
                            GROUP BY Sexo')

gasto_total_genero

## 8- Qual a média de gasto com internações hospitalares por raça do paciente?

media_gasto_por_paciente <- sqldf('SELECT Raça, AVG(Custo_Total) as custo_total FROM df
                                  GROUP BY Raça')

media_gasto_por_paciente

## 9- Para  pacientes  acima  de  10  anos,  
## qual  a  média  de  gasto  total  com  internações hospitalares?

media_gasto_paciente_acima10 <- sqldf('SELECT Idade, AVG(Custo_Total) as custo_total FROM df
                                      WHERE Idade > 10
                                      GROUP BY Idade')

media_gasto_paciente_acima10

## 10- Considerando o item anterior, qual idade tem média de gastos superior a 3000?

result <- sqldf('SELECT Idade, AVG(Custo_Total) as custo_total FROM df 
                WHERE Idade > 10
                GROUP BY Idade
                HAVING custo_total > 3000')

result

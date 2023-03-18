getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap18")

### Mini Projeto ###

## Respondendo perguntas de negócio

library(dplyr)

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

races <- df %>%
  count(Raça)

races

# Resposta: 6 raças estão representadas no dataset

## 2- Qual a idade média dos pacientes?

idade_media <- df %>%
  select(Idade) %>%
  summarise(idade_media = mean(Idade))

idade_media

# Reposta: 5.096 é a idade média dos pacientes

## 3- Qual a moda da idade dos pacientes?

idade_moda <- df %>%
  select(Idade) %>%
  count(Idade) %>%
  top_n(1)

idade_moda

# Reposta: a Moda é 0 anos.

##4- Qual a variância da coluna idade?

var_idade <- df %>%
  summarise(variance = var(Idade))

var_idade

# Resposta: o valor da variância é de 48.34

## 5- Qual o gasto total com internações hospitalares por idade?

gasto_idade <- df%>%
  select(Idade, Custo_Total) %>%
  group_by(Idade) %>%
  summarise(total_idade = sum(Custo_Total)) %>%
  arrange(desc(total_idade))

gasto_idade

## 6- Qual idade gera o maior gasto total com internações hospitalares?
gasto_idade[1, ]

# Resposta: com base na pergunta anterior, a idade de 0 anos gera um gasto maior, 
# um valor de $ 676.962,00

## 7- Qual o gasto total com internações hospitalares por gênero?

gasto_genero <- df %>%
  select(Sexo, Custo_Total) %>%
  group_by(Sexo) %>%
  summarise(gasto_genero = sum(Custo_Total)) %>%
  arrange(desc(gasto_genero))

gasto_genero

# Resposta: O sexo representado pelo numero 0 é o que possui um gasto maior.
# Valor de $ 735.391,00

## 8- Qual a média de gasto com internações hospitalares por raça do paciente?

gasto_medio_raca <- df %>%
  select(Raça, Custo_Total) %>%
  group_by(Raça) %>%
  summarise(gasto_medio = mean(Custo_Total)) %>%
  arrange(desc(gasto_medio))

gasto_medio_raca

## 9- Para  pacientes  acima  de  10  anos,  
## qual  a  média  de  gasto  total  com  internações hospitalares?

gasto_medio_idade <- df %>%
  select(Idade, Custo_Total) %>%
  group_by(Idade) %>%
  filter(Idade > 10) %>%
  summarise(gasto_medio_acima_10anos = mean(Custo_Total))

gasto_medio_idade

## 10- Considerando o item anterior, qual idade tem média de gastos superior a 3000?

gasto_superior_3000 <- df %>%
  select(Idade, Custo_Total) %>%
  group_by(Idade) %>%
  filter(Idade > 10) %>%
  summarise(gasto_medio_idade = mean(Custo_Total)) %>%
  arrange(desc(gasto_medio_idade)) %>%
  filter(gasto_medio_idade > 3000)

gasto_superior_3000
  
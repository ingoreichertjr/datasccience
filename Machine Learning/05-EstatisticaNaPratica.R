# Estatistica na Prática 4 - Análise, Interpretação e Exercício de Teste do Qui-Quadrado

getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap11")

# Suposição do teste:
# As variáveis devem ser independentes!

library(readr)

df <- read_csv('dados.csv') 
View(df)

# Visualizando os dados
dim(df)

# Separando as variáveis quero colocar no teste
x = df$Tipo_Imovel
unique(x)

y = df$Status_Imovel
unique(y)

# Tabela cruzada
table(x, y)
prop.table(table(x,y))
?prop.table

# Definindo as hipóteses:

# H0 = Não há relação entre x e y
# H1 = x e y estão relacionados 

# Se o valor-p for menor que 0.05 rejeitamos a H0

# Teste do Qui-Quadrado
?chisq.test
chisq.test(table(x,y))

# Resposta: Rejeitamos H0, pois sim elas tem relação, o p-value é menor que 0.05

# Exercćio:

# Se não considerarmos os imóveis Apartamento, há diferença no resultado do teste?

new_df <- df[!df$Tipo_Imovel == 'Apartamento', ]
View(new_df)
dim(new_df)

x = new_df$Tipo_Imovel
unique(x)

y = new_df$Status_Imovel
unique(y)

table(x,y)
prop.table(table(x,y))

chisq.test(table(x,y))

# Agora p-value foi maior que 0.05, então nós não rejeitamos H0, ou seja, 
# as varíaveis não possuem relação. 
# Então sim, há diferença no teste
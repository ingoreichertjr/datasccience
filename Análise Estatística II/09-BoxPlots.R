# Interpretando um BoxPlot

# Através do boxplot é possível obter informações sobre vários aspectos, tais como:
# outliers, dispersão, tendêncoas centrais, erros padrão e simetria.

# Utilizado par avaliar a distribuição empírica dos dados, é formado pelo primeiro e terceiro quartis
# juntamente com a mediana

library(ggplot2)

dados = c(18, 22, 32, 56, 78, 15, 46, 89, 36, 11, 23, 45, 89, 65, 45, 35, 79, 37, 19,
          35, 74, 69, 23, 21, 20, 80, 17, 35, 68, 78, 36, 15, 98, 78, 19, 35, 15, 78, 
          78, 98, 16, 68, 15, 68, 32, 16, 99, 59, 23)

mean(dados)
sd(dados)
median(dados)
range(dados)
diff(range(dados))
quantile(dados)

summary(dados)

boxplot(dados, main = 'Este é um Título')

df_dados <- data.frame(dados)
View(df_dados)

?geom_boxplot
ggplot(df_dados, aes(y = dados)) + geom_boxplot()
ggplot(df_dados, aes(dados)) + geom_histogram()

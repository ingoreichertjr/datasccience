# Coeficiente de Curtose (Kurtosis)

# Se preocupa se o histograma está mais achatado ou mais alongado, se preocupa com a altura

dados = c(18, 22, 32, 56, 78, 15, 46, 89, 36, 11, 23, 45, 89, 65, 45, 35, 79, 37, 19,
          35, 74, 69, 23, 21, 20, 80, 17, 35, 68, 78, 36, 15, 98, 78, 19, 35, 15, 78, 
          78, 98, 16, 68, 15, 68, 32, 16, 99, 59, 23)

hist(dados, main = 'Título', xlab = 'Acidentes', ylab = 'Frequência')

mean(dados)
sd(dados)
median(dados)

library(moments)
?kurtosis

CK = kurtosis(dados)
print(CK)

# Outro exemplo 
n.sample <- rnorm(n = 10000, mean = 55, sd = 4.5)

# Skewness e Kurtosis
skewness(n.sample)
kurtosis(n.sample)

# Histograma
datasim <- data.frame(n.sample)
ggplot(datasim, aes(x = n.sample), binwidth = 2) +
  geom_histogram(aes(y = ..density..), fill = 'red', aplha = 0.5) +
  geom_density(colour = 'blue') + xlab(expression(bold('Dados'))) +
  ylab(expression(bold('Densidade')))

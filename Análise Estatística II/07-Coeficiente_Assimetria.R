# Coeficiente de Assimetria (Skewness)

## Coeficiente de Assimetria

# O coeficiente de assimetria é o que permite dizer se uma determinada distribuição é assimétrica ou não
# Ele se preocupa com os lados do histograma, direita e esquerda a partir de uma linha imaginária central

dados = c(18, 22, 32, 56, 78, 15, 46, 89, 36, 11, 23, 45, 89, 65, 45, 35, 79, 37, 19,
          35, 74, 69, 23, 21, 20, 80, 17, 35, 68, 78, 36, 15, 98, 78, 19, 35, 15, 78, 
          78, 98, 16, 68, 15, 68, 32, 16, 99, 59, 23)

hist(dados, main = 'Dados Aleatórios', xlab = 'Aquela Coisa', ylab = 'Todo louco')

mean(dados)
median(dados)
sd(dados)

install.packages('moments')
library(moments)
?skewness

sk = skewness(dados)
print(sk)

# Exemplo de histograma simétrico
set.seed(1234)
x = rnorm(1000) # cria uma distribuição simétrica
hist(x)
skewness(x)
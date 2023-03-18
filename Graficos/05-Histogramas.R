# Histogramas

# Definindo os dados
?cars
View(cars)
dados = cars$speed
dados

# O histograma serve para visualizar a distribuição de frequência de uma variável, neste caso speed

# Construindo um histograma
?hist
hist(dados)

hist(dados, breaks=10, main = 'Histograma de Velocidades')
hist(dados, labels = T, breaks = c(0, 5, 10, 20, 30), main = 'Histograma de Velocidades')
hist(dados, labels = T, breaks = 10, main = 'Histograma de Velocidades')
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = 'Histograma de Velocidades')

# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = 'Histograma de Velocidades')

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(grafico$mids)*length(dados)

lines(xaxis, yaxis, col = 'red')

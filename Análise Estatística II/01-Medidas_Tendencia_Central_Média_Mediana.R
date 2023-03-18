# Medidas de Tendência Central - Média e Mediana

getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap09")

# Formas de encontrar o valor central de um conjunto de dados

# Média
notas = c(6.4, 7.3, 8.5, 9.1, 6.5, 6.8, 8.7, 9.9, 8.6, 8.2)
?mean
mean(notas)
print(mean(notas))

notas_NA = c(6.4, 7.3, 8.5, 9.1, 6.5, 6.8, 8.7, 9.9, 8.6, 8.2, NA, NA, NA)
notas_NA

mean(notas_NA, na.rm = TRUE)

# Mediana
# Valor central de uma distribuição ordenada, 50% dos valores ficam abaixo da mediana e 50% acima 
notas = c(6.4, 7.3, 8.5, 9.1, 6.5, 6.8, 8.7, 9.9, 8.6, 8.2)
?median
median(notas)
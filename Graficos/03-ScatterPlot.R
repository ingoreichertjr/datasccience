# Scatterplot é o mesmo que gráfico de dispersão, muito usado para mostrar a relação entre duas variáveis
getwd()

# Scatterplots

# Define os dados
set.seed(67)
x = rnorm(10, 5, 7)
y = rpois(10, 7)
z = rnorm(10, 6, 7)
t = rpois(10, 9)

# Cria o plot
plot(x, y, col = 123, pch = 10, main = 'Multi Scatterplot',
     col.main = 'red', cex.main = 1.5, xlab = 'Variável Independente',
     ylab = 'Variável Dependente')

# Adiciona outros dados
points(z, t, col = 'blue', pch = 4)
points(y, t, col = 777, pch = 9)


# Cria legenda
legend(-6,5.9, legend = c('Nível 1', 'Nível 2', 'Nível 3'),
       col = c(123, 'blue', 777), pch = c(10,4,9),
       cex = 0.65, bty = 'n')
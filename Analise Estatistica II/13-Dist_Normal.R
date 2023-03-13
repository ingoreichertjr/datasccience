# Distribuição Normal

getwd()

# A distribuição Normal é a mais importante distribuição contínua
# Para termos uma distribuição normal usamos a função rnorm

?rnorm

# x <- rnorm(n, mean, sd)
# Onde n é o tamanho da amostra e mean e sd são parâmetros opcionais relacionados a desvio padrão, 
# respectivamente

x <- rnorm(100)
hist(x)

# Densidade 
# # Observe que o gráfico gerado não apresenta assimetria
# Quando o gráfico da distribuição possui tal forma, há grande chances de se tratar
# de uma distribuição normal.
x <- seq(-6 ,6, by=0.01)
y <- dnorm(x)
plot(x, y, type='l')
# Boxplots

?boxplot
?sleep

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)
View(sleep)

# Construção do boxplot
sleepboxplot = boxplot(data = sleep, extra ~ group, # Este ~ serve para mostrar a relação entre duas variaveis
                       main = 'Duração do Sono',
                       col.main = 'red', ylab = 'Horas', xlab = 'Droga')

# Cálcudo da média
medias = by(extra, group, mean) # O by substitui o for, ele pega as duas veriaveis e calcula sobre a função passada (terceiro argumento)

# Adiciona a média ao gráfico
points(medias, col = 'red')

# Importante ir montanto o gráfico camada a camada, primeiro fizemos o plot, depois colocamos a média, e assim vai...

# Boxplot horizontal
horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = '', xlab = '', horizontal= T)

horizontalboxplot = boxplot(data = sleep, extra ~ group,
                            ylab = '', xlab = '', horizontal= T,
                            col = c('blue', 'red'))
# Bar Plots

?barplot

# Preparando os dados - número de casamentos em uma igreja de SP
dados <- matrix(c(652, 1537,598, 36, 46, 38, 21, 218, 512, 327, 106, 37), nrow = 3, byrow = T)
dados

# Nomeando linhas e colunas na matriz
colnames(dados) <- c('0', '1-150', '151-300', '>300')
rownames(dados) <- c('Jovem', 'Adulto', 'Idoso')
dados

# Construindo o Barplot
barplot(dados, beside = T)

# Construindo o plot - Stacked Bar Plot
# As 3 faixas de idade são representadas na mesma coluna para as diferentes quantidades
barplot(dados, col = c('steelblue1', 'tan3', 'seagreen3'))

# Criando legenda
colors()
?legend

legend('topright', legend = c('Jovem', 'Adulto', 'Idoso'),
       col = c('steelblue1', 'tan3', 'seagreen3'),
       fill = c('steelblue1', 'tan3', 'seagreen3'),
       title = 'Cores por grupo')

# Agora temos uma coluna para cada faixa etária, mas na mesma faixa de quantidade
barplot(dados, beside = T, col = c('steelblue1', 'tan3', 'seagreen3'))
legend('topright', pch = 1, col = c('steelblue1', 'tan3', 'seagreen3'), legend = c('Jovem', 'Adulto', 'Idoso'))

# Como inverter as posições entre faixa etaria e faixa de quantidade? Com a transposta da matriz
t(dados)
barplot(t(dados), beside = T, col = c('steelblue1', 'tan3', 'seagreen3'))
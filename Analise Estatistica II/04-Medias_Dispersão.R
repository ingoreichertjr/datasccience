# Medidas de Dispersão - Desvio Padrão e Variância

# Desvio Padrão

# Grau de variação de um conjunto de dados

# Exemplo: Qual das máquinas de corte possuem o menor desvio padrão e é a mais indicada?
Maq1 <- c(181.9, 180.8, 181.9, 180.2, 181.4)
Maq2 <- c(180.1, 181.8, 181.5, 181.2, 182.4)
Maq3 <- c(182.1, 183.7, 182.1, 180.2, 181.9)

mean(Maq1)
mean(Maq2)
mean(Maq3)

sd(Maq1)
sd(Maq2)
sd(Maq3)

# Maq1 será escolhida, quer dizer que ela é a mais precisa (que demonstra mais regularidade)

dados1 <- c(0, 5, 10)
dados2 <- c(4, 5, 6)

mean(dados1)
mean(dados2)
# Os dois possuem a mesma média

sd(dados1)
sd(dados2)
# O desvio padrão do conjunto dois é menor


# Variância

# A variância é o quadrado do desvio padrão, desta forma se elimina os valores negativos

var(Maq1)
var(Maq2)
var(Maq3)
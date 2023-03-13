# Quartil e Percentil

# São os valores que representam 25%, 50% e 75% de uma distribuição de valores
# São chamados de Quartis pq são resultado de uma divisão em 4 partes iguais do conjunto
# 1º Quartil - 25%
# 2º Quartil - 50% e é igual a Mediana
# 3º Quartil - 75%

# Podemos querer calcular Percentis, ou seja dividir em 100 partes iguais (5%, 22%, 75%, 89%)
# Decil divide o conjunto em 10 partes iguais (10%, 30%, 60%)

num_fichas <- c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
?quantile

quantile(num_fichas)
median(num_fichas)

# Percentis

num_fichas <- c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
quantile(num_fichas, c(.10)) # 10% dos dados estão abaixo desse valor
quantile(num_fichas, c(.66)) # 66% dos dados estão abaixo desse valor
quantile(num_fichas, c(.89)) # 89% dos dados estão abaixo desse valor

# posso fazer com vetor definindo os pontos que quero
quantile(num_fichas, c(.10, .66, .89))
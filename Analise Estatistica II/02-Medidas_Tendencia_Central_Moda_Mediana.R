# Moda e Mediana

getwd()

# Moda
# Valor que mais se repete dentro de um conjunto de dados

tamanhos <- c(39, 38, 36, 35, 38, 36, 36, 37, 34, 38, 39, 35, 36, 37, 36)
mean(tamanhos)
median(tamanhos)

moda = function(dados) {
  vetor = table(as.vector(dados))
  names(vetor)[vetor == max(vetor)]
}

moda(tamanhos)

# Valores Máximos e Mínimos
tamanhos <- c(39, 38, 36, 35, 38, 36, 36, 37, 34, 38, 39, 35, 36, 37, 36)
max(tamanhos)
min(tamanhos)

# Amplitude
# Diferença entr o maior e o menor valor de um conjunto de dados
tamanhos <- c(39, 38, 36, 35, 38, 36, 36, 37, 34, 38, 39, 35, 36, 37, 36)
max <- max(tamanhos)
min <- min(tamanhos)

amplitude <- max - min
amplitude

# Posso calcular com range que vai me trazer os valores max e min
range(tamanhos)
diff(range(tamanhos))

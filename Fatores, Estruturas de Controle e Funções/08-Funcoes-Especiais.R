# Funções Especiais

# unlist()
# Produz um vetor com os elementos da lista (transforma um objeto de várias dimensãoes em uma dimensão só)
?unlist

lst1 <- list(6, 'b', 15)
lst1
class(lst1)

vec1 <- unlist(lst1)
class(vec1)
vec1

lst2 <- list(v1 = 6, v2 = list(381, 2190), v3 = c(30, 217))
lst2

unlist(lst2)

mean(unlist(lst2))
round(mean(unlist(lst2)))

# do.call()
# Executa uma função em um objeto inteiro, difernte da familia apply que aplica uma função em cada elemento
?do.call

data <- list()
N <- 100

for (n in 1:N) {
  data[[n]] = data.frame(index = n, char = sample(letters, 1), z = rnorm(1))
}

head(data)

do.call(rbind, data)
class(do.call(rbind, data))

# lapply() x do.call()
y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum)
do.call(sum, y)

# O resultado da função lapply() pode ser obtido de outras formas 
# Pacote plyr

install.packages('plyr')
library(plyr)

y <- list(1:3, 4:6, 7:9)
y

ldply(y, sum)

# strsplit()
# Divide uma string ou vetor de caracteres

texto <- 'Data Science Academy'
strsplit(texto, ' ')

texto <- 'Data Science Adamey'
strsplit(texto, '')

dates <- c('1998-05-23', '2008-12-30', '2009-11-29')
temp <- strsplit(dates, '-')
temp
class(temp)

# Transforma a lista em matriz, fazendo antes um unlist()
matrix(unlist(temp), ncol = 3, byrow = TRUE)

Names <- c('Brin, Sergey', 'Page, Larry', 'Dorsey, Jack', 'Glass, Noah', 'Willians, Evan', 'Stone, Biz')

temp <- strsplit(Names, ', ')
temp
class(temp)

frase <- 'Muitas vezes temos que repetir algo diversas vezes e essas diversas vezes parecem estranho'
palavras <- strsplit(frase, ' ')[[1]]
palavras
unique(tolower(palavras))
class(palavras)

# strsplit() com dataframes
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua','pao_e_agua_2'))
antes
strsplit(as.character(antes$tipo), '_e_')

library(stringr)
str_split_fixed(antes$tipo, '_e_', 2)

# Usando do.call()
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua','pao_e_agua_2'))
antes
depois <- strsplit(as.character(antes$tipo), '_e_')
depois
do.call(rbind, depois)

# Usando dplyr e tidyr
install.packages('dplyr')
install.packages('tidyr')
library(dplyr)
library(tidyr)

antes <- data.frame(
  attr = c(1, 30, 4, 6),
  tipo = c('pao_e_agua','pao_e_agua_2')
)

antes %>%
  separate(tipo, c('pao', 'agua'), '_e_')
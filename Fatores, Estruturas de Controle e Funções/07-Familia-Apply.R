# Familia Apply - Uma forma elegante de fazer loops

# apply() - arrays e matrizes
# tapply() - os vetores podem ser dividos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versão amigável do lapply
# vapply() - similar a sapply, com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista
# mapply() - similar a sapply, multivariada
# by

# Se você estiver trabalhando com os objetos:

# list, numeric, character (list/vetor) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações específicas => apply

# Usando um loop
lista1 <- list(a = (1:20), b = (35:67))
lista1

# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0

for (i in lista1$a){
  valor_a = valor_a + i
}

for (j in lista1$b){
  valor_b = valor_b + j
}

print(valor_a)
print(valor_b)

# Calculando cada elemento da lista com sapply
?sapply
sapply(lista1, sum)
sapply(lista1, mean)

# apply()
?apply

x <- matrix(c(20, 13, 65, 32, 45, 12, 76, 49, 82), nr = 3, byrow = T)
x

apply(x, mean)
apply(x, 1, mean)
apply(x, 2, mean)
apply(x, 1, plot)

resultapply <- apply(x, 1, mean)
resultapply

# Aplicando apply() a um Dataframe
escola <- data.frame(Aluna = c('Bob', 'Tereza', 'Marta', 'Felipe', 'Zacarias', 'Elton'),
                     Física = c(91, 82, 75, 97, 62, 74),
                     Matemática = c(99, 100, 86, 92, 91, 87),
                     Quimica = c(56, 72, 49, 68, 59, 77))

escola
escola$Matemática

# Calculando a média por aluno
escola$Média = NA
escola

escola[, c(2,3,4)]

escola$Média <- apply(escola[, c(2, 3, 4)], 1, mean)
escola
escola$Média = round(escola$Média)
escola

# tapply()
?gl
tabela_basquete <-
  data.frame(equipe = gl(5,5, labels = paste('Equipe', LETTERS[1:5])),
             jogador = sample(letters, 25),
             num_cestas = floor(runif(25, min=0, max=50)))

View(tabela_basquete)
summary(tabela_basquete)

# Como calcular o total de cestas por equipe?

# tapply() vs sqldf
install.packages('sqldf')
library(sqldf)

sqldf('select equipe, sum(num_cestas) from tabela_basquete group by equipe')

# primeiro elemento é o que quero somar e o segundo é o que quero agrupar
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)

# by
?by

dat <- data.frame(species=c(rep(c(1,2,3), each=5)),
                  petal.length=c(rnorm(5, 4.5, 1),
                                 rnorm(5, 4.5, 1),
                                 rnorm(5, 5.5, 1)),
                  petal.witdh=c(rnorm(5, 2.5, 1),
                                 rnorm(5, 2.5, 1),
                                 rnorm(5, 4, 1)))
dat

dat$species <- factor(dat$species)
View(dat)

# Calcular o comprimento médio da pétala de cada espécie
by(dat, dat$species, function(x){
  mean.pl <- mean(x$petal.length)
})

# lapply()
?lapply

lista1 <- list(a = (1:10), b = (45:77))
lista1
lapply(lista1, sum)
sapply(lista1, sum) # diferença de entrega do resultado

# vapply
vapply(lista1, fivenum, c(Min. = 0, '1stQu.' = 0, Median = 0, '3rd Qu.' = 0, Max = 0))

# replicate
?replicate
replicate(7, runif(10))

# mapply()
?mapply
mapply(rep, 1:4, 4:1)

# rapply()
?rapply

lista2 <- list(a = c(1:5), b = c(6:10))
lista2

rapply(lista2, sum)
rapply(lista2, sum, how = 'list')
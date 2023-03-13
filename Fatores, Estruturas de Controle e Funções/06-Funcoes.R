# Funções

getwd()

# Help
?sample
args(sample)
args(mean)
args(sd)

# Funções Built-in
abs(-43)
sum(c(1:5))
mean(c(1:10))
round(c(1.1:5.8))
rev(c(1:5))
seq(1:10)
sort(rev(c(5:1)))
append(c(1:5), 6)

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2

# Funções dentro de funções
plot(rnorm(10))
mean(c(abs(vec2), abs(1:10))) # junta tudo dentro de um vetor

# Criando funções
myfunc <- function(x) {x + x}
myfunc(10)
class(myfunc)

myfunc2 <- function(a, b) {
  res = a ^ b
  print(res)
}
myfunc2(3,2)

jogando_dados <- function() {
  num <- sample(1:6, size = 1)
  num
}
jogando_dados()

# Escopo
print(num) # Erro pq o escopo dela pertence a função de cima
num <- c(1:6)
num # Agora ela é uma variavel global, o outro num é uma variavel local

# Funções sem numero definido de argumentos
vec1 <- (10:13)
vec2 <- c('a', 'b', 'c', 'd')
vec3 <- c(6.5, 9.1, 11.9, 5.1)

myfunc3 <- function(...){
  df = data.frame(cbind(...))
  print(df)
}

myfunc3(vec1)
myfunc3(vec2, vec3)
myfunc3(vec1, vec2, vec3)
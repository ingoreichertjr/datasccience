# Variaveis em R

getwd()

# Criando Variaveis
var1 = 100
var1
mode(var1)
help('mode')
sqrt(var1)

# Podemos atribuir o valor de uma variavel a outra variavel
var2 = var1
var2
mode(var2)
typeof(var2)
help('typeof')

# Uma variavel pode ser uma lista de elemetos
var3 = c('primeiro', 'segundo', 'terceiro')
var3
mode(var3)

# Uma variavel poder ser uma função
var4 = function (x) {x+5}
var4
mode(var4)

# Podemos mudar o modo do dado
var5 = as.character(var1)
var5
mode(var5)

# Atribuindo valores a objetos
x <- c(1,2,3)
x
x1 = c(1,2,3)
x1
c(1,2,3) -> y
y
assign('x', c(6.3,4,-2))
x
x == x1

# Verificando o valor em uma posição específica
x[1]

# Verificar objetos
ls()
objects()

# Remover objetos
rm(x)
x
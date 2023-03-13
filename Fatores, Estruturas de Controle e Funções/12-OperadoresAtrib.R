# Operadores de Atribuição

vec1 = 1:4
vec2 <- 1:4

class(vec1)
class(vec2)

typeof(vec1)
typeof(vec2)

mean(x = 1:10)
x

mean(x <- 1:10)
x

# Eles se comportam de uma meneira diferente dentro de uma função
# Com = a variavel recebe o valor e descarta logo depois que é utilizada
# Com <- o valor é mantido
# Se não estiver usando dentro de uma função, não faz diferença

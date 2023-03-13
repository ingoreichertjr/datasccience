# Tipos Básicos de Dados em R

getwd()

# Numeric - Todos os números criados em R são de modo numeric
# São armazenados como números decimais (double)
num1 <- 7
num1
class(num1)
mode(num1)
typeof(num1)

num2 = 16.82
num2
mode(num2)
typeof(num2)

# Integer
# Convertemos tipos nueros para integer
is.integer(num2) # Faz uma pergunta para o interpretador
y = as.integer(num2)
y
class(y)
mode(y)
typeof(y)

as.integer('3.17')
as.integer("Joe")
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)
as.integer('TRUE')

# Character
char1 = 'A'
char1
mode(char1)
typeof(char1)

char2 = 'cientista'
char2
mode(char2)
typeof(char2)

char3 = c('Data', 'Science', 'Academy')
char3
mode(char3)
typeof(char3)

# Compĺex
compl = 2.5 + 4i
compl
mode(compl)
typeof(compl)

sqrt(-1) # Não é possivel tirar a raiz quadrada de -1, mas com números complexos é:
sqrt(-1+0i)
sqrt(as.complex(-1))

# Logic
x = 1; y = 2
z = x > y
z
class(z)

u = TRUE; v = FALSE
class(u)
u & v
u | v
!u

# Operações com 0
5/0
0/5

# Erro
'Joe'/5

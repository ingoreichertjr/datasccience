# Manipulação de Arquivos XML

getwd()

install.packages('XML')
library('XML')
library('methods')

# Carrega o arquivo
resultado <- xmlParse(file = 'funcionarios.xml')
print(resultado)

# Extrai o nó raiz
rootnode <- xmlRoot(resultado)
print(rootnode[1])

# Número de nós no arquivo
rootsize <- xmlSize(rootnode)
print(rootsize)

# Primeiro elemento do primeiro nó
print(rootnode[[1]][[1]])
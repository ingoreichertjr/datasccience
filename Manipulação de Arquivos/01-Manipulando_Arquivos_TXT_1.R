getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap05")

# Carregando e Manipulando Arquivos TXT - Parte 1

# Usando as funções da base do R (pacote utils)
search()

# Importando arquivo com read.table()
?read.table

# Importa padrão, todos os dados ficam em uma coluna apenas
df1 <- read.table('jogadores.txt')
df1
dim(df1)

# Especificamos o cabeçalho e o separador, para criar diferentes colunas
df2 <- read.table('jogadores.txt', header = TRUE, sep = ',')
df2
dim(df2)

# Renoeamos as colunas
df3 <- read.table('jogadores.txt', header = TRUE, sep = ',',
                  col.names = c('var1', 'var2', 'var3'))
df3

# Colocando valores NA 
df4 <- read.table('jogadores.txt', header = TRUE, sep = ',',
                  col.names = c('var1', 'var2', 'var3'),
                  na.strings = c('Tulio', 'Romario')) 
df4

str(df4)

# Setando para as variaveis strings ja inicializarem como fator
df5 <- read.table('jogadores.txt', header = TRUE, sep = ',',
                  col.names = c('var1', 'var2', 'var3'),
                  na.strings = c('Tulio', 'Romario'),
                  stringsAsFactors = TRUE) 

str(df5)


# Importando arquivo com read.csv()
# Ele reconhece o separador de colunas
df1 <- read.csv('jogadores.txt')
df1
dim(df1)

# Read.csv2 não reconhece
df2 <- read.csv2('jogadores.txt')
df2
dim(df2)

# Colocando separador 
df3 <- read.csv2('jogadores.txt', sep = ',')
df3
dim(df3)

# Importar com delim tambem necessita de separador
df4 <- read.delim('jogadores.txt')
df4
dim(df4)

df4 <- read.delim('jogadores.txt', sep = ',')
df4
dim(df4)

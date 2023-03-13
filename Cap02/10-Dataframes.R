# DataFrames e Operações com DataFrame

getwd()

# Criando um dataframe vazio
df <- data.frame()
class(df)
df

# Criando vetores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame(c(nomes, idades, itens, codigos))
df

# Criando vetores 
pais = c('Portugal', 'Inglaterra', 'Irlanda', 'Egito', 'Brasil')
nome = c('Bruno', 'Tiago', 'Amanda', 'Bianda', 'Marta')
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)

# Criando um dataframe de diversos vetores
pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c('verde', 'azul', 'azul', 'castanho', 'castanho')
pesq = cbind(pesquisa, olhos)
pesq

# Informações sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)

?str()

# Obtendo um vetor de um dataframe
pesq$pais
pesq$nome
pesq$altura
pesq$codigo

# Extraindo um unico valor
pesq
# Quero obter o codigo da Inglaterra
pesq[2,4]
# Quero obter o noome da pessoa do Egito
pesq[4,2]

# Numero de linhas e colunas
nrow(pesq)
ncol(pesq)

# Retornando os 3 primeiros e os 3 ultimos elementos do dataframe
head(pesq, n=3L)
tail(pesq, n=3L)
?head

# Dataframe que ja vem no R para uso
mtcars
View(mtcars)

# Filtro para um subset de dados que atendem a um critério
pesq
pesq[altura < 1.60,]
pesq[altura < 1.60, c('codigo', 'olhos')]
pesq[olhos == 'castanho', c('nome')]

# Dataframes Nomeados
names(pesq) <- c('Var 1', 'Var 2', 'Var 3', 'Var 4', 'Var 5')
pesq

colnames(pesq) <- c('Var 1', 'Var 2', 'Var 3', 'Var 4', 'Var 5')
rownames(pesq) <- c('Obs 1', 'Obs 2', 'Obs 3', 'Obs 4', 'Obs 5')
pesq

# Carregando um arquivo csv
?read.csv
pacientes <- data.frame(read.csv(file = 'pacientes.csv', header = TRUE, sep = ','))

# Visualizando o dataset
View(pacientes)
head(pacientes, n=4L)
summary(pacientes)

# Visualizando as variaves
pacientes$Idade
pacientes$Diabete
pacientes$Status

# Histograma
hist(pacientes$Idade)

# Combinando dataframes
dataset_final <- merge(pesq, pacientes)
dataset_final
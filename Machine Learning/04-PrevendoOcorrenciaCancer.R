# Prevendo a Ocorrência de Câncer

getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap11")

# Etapa 1 - Coletando os Dados

# Definição do Problema de Negócio: Previsão de Ocorrência de Câncer de Mama
# http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29

# Os dados do câncer da mama incluem 569 observações de biópsias de câncer, 
# cada um com 32 características (variáveis). Uma característica é um número de 
# identificação (ID), outro é o diagnóstico de câncer, e 30 são medidas laboratoriais 
# numéricas. O diagnóstico é codificado como "M" para indicar maligno ou "B" para 
# indicar benigno.

library(readr)

dados <- read_csv('dataset.csv')
str(dados)
View(dados)


# Etapa 2 - Pŕe Processamento

# Excluiindo a coluna ID
# Independente do método de aprendizagem de máquina, deve ser sempre excluídas variáveis de ID.
# Pois o ID pode ser utilizado como uma variável para a previsão.

dados$id = NULL
View(dados)

# Ajustando o label da variável alvo
dados$diagnosis = sapply(dados$diagnosis, function(x){ifelse(x=='M', 'Maligno', 'Benigno')})
View(dados)

# Muitos classificadores requerem que as variáveis sejam do tipo Fator
table(dados$diagnosis)
dados$diagnosis <- factor(dados$diagnosis, levels = c('Benigno', 'Maligno'), labels = c('Benigno', 'Maligno'))
str(dados$diagnosis)

## Corrigindo problemas de escala das variáveis

# Medidas de Tendência Central
# Detectamos um problema de escala entre os dados, que então precisam ser normalizados
# O cálculo de distância feito pelo kNN é dependente das medidas de escala nos dados de entrada.
summary(dados[c('radius_mean', 'area_mean', 'smoothness_mean')])
## Dados próximos entre mediana e média mostram uma distribuição próxima da normalidade

# Criando uma função de normalização
normalizar <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}

# Testando a função de normalização - os resultados devem ser idênticos
normalizar(c(1, 2, 3, 4, 5))
normalizar(c(10, 20, 30, 40, 50))

# Normalizando os dados 
dados_norm <- as.data.frame(lapply(dados[2:31], normalizar))
View(dados_norm)


## Etapa 3: Treinando o modelo com KNN

# Carregando o pacote library
install.packages('class')
library(class)
?knn

# Criando dados de treino e de teste
dados_treino <- dados_norm[1:469, ]
dados_teste <- dados_norm[470:569, ]

# Criando os labels para os dados de treino e de teste
dados_treino_labels <- dados[1:469, 1]
dados_teste_labels <- dados[470:569, 1]
length(dados_treino_labels)
length(dados_teste_labels)

# Criando o modelo
modelo_knn_v1 <- knn(train = dados_treino,
                     test = dados_teste,
                     cl = dados_treino_labels,
                     k = 21)

# A função knn() retorna um objeto do tipo fator com as previsões para cada exemplo no dataset de teste
summary(modelo_knn_v1)


## Etapa 4 - Avaliando e Interpretando o Modelo

# Carregando o gmodels
library(gmodels)

# Criando uma tabela cruzada dos dados previstos x dados atuais
# Usaremos amostra com 100 observações: length(dados_teste_labels)
CrossTable(x = dados_teste_labels, y = modelo_knn_v1, prop.chisq = FALSE)

# Interpretando os Resultados
# A tabela cruzada mostra 4 possíveis valores, que representam os falso/verdadeiro positivo e negativo
# Temos duas colunas listando os labels originais nos dados observados
# Temos duas linhas listando os labels dos dados de teste

# Temos:
# Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 61 casos - true positive 
# Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 00 casos - false positive (o modelo errou)
# Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 02 casos - false negative (o modelo errou)
# Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 37 casos - true negative 

# Lendo a Confusion Matrix (Perspectiva de ter ou não a doença):

# True Negative  = nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que realmente a pessoa NÃO tinha a doença
# False Positive = nosso modelo previu que a pessoa tinha a doença e os dados mostraram que NÃO, a pessoa tinha a doença
# False Negative = nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que SIM, a pessoa tinha a doença
# True Positive = nosso modelo previu que a pessoa tinha a doença e os dados mostraram que SIM, a pessoa tinha a doença

# Falso Positivo - Erro Tipo I
# Falso Negativo - Erro Tipo II

# Taxa de acerto do Modelo: 98% (acertou 98 em 100)


## Etapa 5: Otimizando a Performance do Modelo

# Usando a função scale() para padronizar o z-score
?scale() #Faz uma escala e uma centralização dos objetos
dados_z <- as.data.frame(scale(dados[-1]))
View(dados_z)

# Confirmando transformação realizada com sucesso
summary(dados_z$a)

# Confirmando transformação realizada com sucesso
summary(dados_z$area_mean)

# Criando novos datasetes de treino e de teste
dados_treino <- dados_z[1:469, ]
dados_teste <- dados_z[470:569, ]

dados_treino_labels <- dados[1: 469, 1]
dados_teste_labels <- dados[470: 569, 1]

# Reclassificando 
modelo_knn_v2 <- knn(train = dados_treino,
                     test = dados_teste,
                     cl = dados_treino_labels, 
                     k = 15)

# Criando uma tabela cruzda dos dados previstos x dados atuais
CrossTable(x = dados_teste_labels, y = modelo_knn_v2, prop.chisq = FALSE)

# O modelo piorou 1% em comparação ao anterior

# Etapa 6 - Construindo um Modelo de Algoritmo Support Vector Machine (SVM)

# Defininindo a semente para resutados reproduziveis
set.seed(40)

# Prepara o dataset
dados <- read.csv('dataset.csv', stringsAsFactors = TRUE)
dados$id = NULL
dados[, 'index'] <- ifelse(runif(nrow(dados)) < 0.8,1,0) # Para separar em treino e teste
View(dados)

# Dados de treino e teste
trainset <- dados[dados$index == 1, ]
testeset <- dados[dados$index == 0, ]

# Obter o índice
trainColNum <- grep('index', names(trainset))

# Remover o índice dos datasets
trainset <- trainset[,-trainColNum]
testset <- testeset[,-trainColNum]

# get column index of predicted variable in dataset
typeColNum <- grep('diag', names(dados))

# Cria o modelo
# Nós ajustamos o kernel para radial, já que este conjunto de dados não tem um 
# plano linear que pode ser desenhado

library(e1071)
modelo_svm_v1 <- svm(diagnosis ~ .,
                     data = trainset,
                     type = 'C-classification',
                     kernel = 'radial')

# Previsões

# Previsões no dados de treino
ped_train <- predict(modelo_svm_v1, trainset)

# Percentual de previsões corretas com dataset de treino
mean(ped_train == trainset$diagnosis)

# Previsões no dados de teste
pred_test <- predict(modelo_svm_v1, testeset)

# Percentual de previsões corretas com dataset de teste
mean(pred_test == testeset$diagnosis)

# Confusion Matrix
table(pred_test, testeset$diagnosis)

# Etapa 7 - Construindo um Modelo com Algoritmo Random Forest

# Criando o modelo
library(rpart)
modelo_rf_1 = rpart(diagnosis ~ ., data = trainset, control = rpart.control(cp = .0005))

# Previsões nos dados de teste
tree_pred = predict(modelo_rf_1, testset, type = 'class')

# Percentual de previsões corretas com dataset de teste
mean(tree_pred==testeset$diagnosis)

# Construindo Confusion Matrix
table(tree_pred, testeset$diagnosis)

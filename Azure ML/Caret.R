getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap12")

install.packages('caret')
install.packages('randomForest')

library(caret)
library(randomForest)
library(datasets)

# Usando o dataset mtcars
?mtcars
View(mtcars)

# Função do caret para divisão dos dados
?createDataPartition
split <- createDataPartition(y = mtcars$mpg, p = 0.7, list = FALSE)

# Criando dados de treino e de teste
dados_treino <- mtcars[split,]
dados_teste <- mtcars[-split,]
View(dados_treino)
View(dados_teste)

# Treinando o modelo
?train
names(getModelInfo()) # Mostra todas as funções do pacote caret

# Mostrando a importância das variaveis para a criação do modelo
?varImp

modelol_v1 <- train(mpg ~ ., data = dados_treino, method = 'lm')
summary(modelol_v1)
varImp(modelol_v1)

# Montando o modelo com as variáveis mais importantes
# Regressão Linear
modelol_v2 <- train(mpg ~ wt + cyl + hp + vs, data = dados_treino, method = 'lm')
summary(modelol_v2)

# Random Forest
modelol_v3 <- train(mpg ~ wt + cyl + hp + vs, data = dados_treino, method = 'rf')
summary(modelol_v3)

# Colocando mais algumas variáveis
modelol_v4 <- train(mpg ~ wt + cyl + hp + vs + drat + carb + disp + gear, 
                    data = dados_treino, 
                    method = 'lm')
summary(modelol_v4)


# Ajustando o modelo 
?expand.grid
?trainControl
controle1 <- trainControl(method = 'cv', number = 10) # Utilizando o cross validation

modelol_v5 <- train(mpg ~ .,
                    data = mtcars,
                    method = 'lm',
                    trControl = controle1,
                    metric = 'Rsquared')
summary(modelol_v5)
# Não trouxe melhor resultado, mas em alguns casos ajuda a melhorar a performance do modelo

# Coletando os residuos
residuals <- resid(modelol_v1)
residuals

# Previsoes
?predict
predictValues <- predict(modelol_v1, dados_teste)
predictValues
plot(dados_teste$mpg, predictValues)

# Plot das variáveis mais relevantes no modelo
plot(varImp(modelol_v1))
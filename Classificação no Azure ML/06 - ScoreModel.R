# Fazendo Previsões

# Previsões com um modelo de classificação baseado em randomForest
require(randomForest)

# Gerando previsões nos dados de teste
previsoes <- data.frame(observado <- dados_teste$CreditStatus,
                        previsto <- predict(modelo, newdata = dados_teste))

# Visualizando o resultado
View(previsoes)
View(dados_teste)
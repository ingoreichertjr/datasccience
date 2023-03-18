getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap19")

# Instalação dos pacotes
install.packages('h2o')
install.packages('tidyverse')
install.packages('ggbeeswarm')

# Carrega os pacotes
library(h2o)
library(tidyverse)
library(ggbeeswarm)

# Preparação da massa de dados
df <- tibble(produtividde = c(rnorm(1000), rnorm(1000, 0.25)),
             rendimento = runif(2000),
             custo = rf(2000, df1 = 5, df2 = 2),
             prioridade = c(sample(rep(c('Baixa', 'Média', 'Alta'), c(300, 300, 400))),
                            sample(c('Baixa', 'Média', 'Alta'), 1000, prob = c(0.25, 0.25, 0.5),
                                   replace = TRUE)),
             eficiencia = rnorm(2000),
             manutencao = rep(c(0,1), c(1050,950)))

View(df)

# Dimensões
dim(df)

# Tipos de dados
str(df)

# A variável alvo é "manutenção"
table(df$manutencao)

# A variável "prioridade" é categórica
table(df$prioridade)

# Vamos converter a variável alvo para o tipo fator
# Isso é requerido pelo H2O
df <- df %>%
  mutate(manutencao = as.factor(manutencao)) %>%
  mutate_if(is.character, factor)

str(df)

### Iniciando o trabalho com AutoML ###

# É necessário inicializar o H2O(Framework de Machine Learning)
h2o.init()

# O H2O requer que os dadis estejam em formato de dataframe do H2O
h2o_frame <- as.h2o(df)
class(h2o_frame)
head(h2o_frame)

# Split dos dados em treino e teste
?h2o.splitFrame

h2o_frame_split <- h2o.splitFrame(h2o_frame, ratios = 0.77)
head(h2o_frame_split)

# Modelo AutoML
?h2o.automl

modelo_automl <- h2o.automl(y = 'manutencao',
                            balance_classes = TRUE,
                            training_frame = h2o_frame_split[[1]],
                            nfolds = 4,
                            leaderboard_frame = h2o_frame_split[[2]],
                            max_runtime_secs = 60 * 2,
                            include_algos = c('XGBoost', 'GBM', 'GLM'),
                            sort_metric = 'AUC')

# Extrai o leaderboard
leaderboard_automl <- as.data.frame(modelo_automl@leaderboard)
View(leaderboard_automl)

# Extrai o melhor modelo
lider_automl <- modelo_automl@leader
View(lider_automl)

# Para o melhor modelo extraimos a contribuição de cada variável para as previsões
# os valores extraídos são chamados de valores SHAP
# Usamos os dados de dataset
?predict_contributions.H2OModel
var_contrib <- predict_contributions.H2OModel(lider_automl, h2o_frame_split[[2]])

# Vamos visualizar o resultado final

# Primeiro preparamos um dataframe com as métricas que precisamos
df_var_contrib <- var_contrib %>%
  as.data.frame() %>%
  select(-BiasTerm) %>%
  gather(feature, shap_value) %>%
  group_by(feature) %>%
  mutate(shap_importance = mean(abs(shap_value)), shap_force = mean(shap_value)) %>%
  ungroup()

View(df_var_contrib)

# Plot da importância de cada variável para prever a variável alvo
df_var_contrib %>%
  select(feature, shap_importance) %>%
  distinct() %>%
  ggplot(aes(x = reorder(feature, shap_importance), y = shap_importance)) +
  geom_col(fill = 'blue') +
  coord_flip() +
  xlab(NULL) +
  ylab('Valor Médio das Métricas SHAP') +
  theme_minimal(base_size = 15)

# Plot de contribuição de cada variável para explicar a variável alvo
ggplot(df_var_contrib, aes(x = shap_value, y = reorder(feature, shap_importance))) +
  ggbeeswarm::geom_quasirandom(groupOnX = FALSE, varwidth = TRUE, size = 0.9, alpha = 0.5, width = 0.15) +
  xlab('Contribuição da Variável') +
  ylab(NULL) +
  theme_minimal(base_size = 15)

# Desliga o H2O
h2o.shutdown()


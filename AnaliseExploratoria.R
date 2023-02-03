getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap16")


## Análise Exporatória - Respondendo Perguntas de Negócio

# Importando pacotes
library(dplyr)
library(ggplot2)


# Importando os dados
df <- read.csv('dataset.csv')
View(df)
str(df)
dim(df)

# Analisando estatísticas básicas das variáveis
summary(df)

# Omitindo valores NA
df_paises <- df$Country.name
length(unique(df_paises))
sum(is.na(df))
df <- na.omit(df)
df_paises_no_na <- df$Country.name
length(unique(df_paises_no_na))

# Países que não fazem mais parte do meu DataSet
setdiff(df_paises, df_paises_no_na)

# Altenrando o nome das variaveis

new_colNames <- c('Pais', 'Ano', 'IndivadorNivelVida', 'PIB_per_Capita', 'SuporteSocial', 
              'ExpectativaVida', 'IndicadorLiberdade', 'IndicadorGenerosidade', 
              'IndicadorCorrupcao', 'IndicadorEmocoesPositivas', 'IndicadorEmocoesNegativas')

colnames(df) <- new_colNames
View(df)


# Sumarizando o DataSet pela média das variáveis por ano de cada país

df_mean <- df %>%
  select(Pais, 
         IndivadorNivelVida, 
         PIB_per_Capita, 
         SuporteSocial, 
         ExpectativaVida,
         IndicadorLiberdade,
         IndicadorGenerosidade,
         IndicadorCorrupcao, 
         IndicadorEmocoesPositivas,
         IndicadorEmocoesNegativas) %>%
  group_by(Pais) %>%
  summarise(IndicadorNivelVida = mean(IndivadorNivelVida),
            PIB_per_Capita = mean(PIB_per_Capita),
            SuporteSocial = mean(SuporteSocial),
            ExpectativaVida = mean(ExpectativaVida),
            IndicadorLiberdade = mean(IndicadorLiberdade),
            IndicadorGenerosidade = mean(IndicadorGenerosidade),
            IndicadorCorrupcao = mean(IndicadorCorrupcao),
            IndicadorEmocoesPositivas = mean(IndicadorEmocoesPositivas),
            IndicadorEmocoesNegativas = mean(IndicadorEmocoesNegativas))

View(df_mean)
dim(df_mean)

# Respondendo Perguntas de Negócio

# Pergunta 1:
# O aumento do PIB per capita de um país afeta positivamente a 
# expectativa de vida dos cidadãos ao nascer? 
# Qual a correlação entre essas duas variáveis?

ggplot(df_mean, aes(x = PIB_per_Capita, y = ExpectativaVida)) +
  geom_point() +
  geom_smooth() +
  ggtitle('Relação entre o PIB per Capita e a Expectativa de Vida') +
  labs(x = 'PIB per Capita', y = 'Expectativa de Vida')

cor.test(df_mean$PIB_per_Capita, df_mean$ExpectativaVida, method = 'pearson')

# Resposta da pergunta:
# Sim, existe uma correlação entre as duas varíaveis, fica nítido analisando o gráfico
# que com o aumento do PIB per Capita ocorre um aumento da Expectativa de Vida.
# Ou seja, existe uma correlação positiva, que se confirma com o teste de pearson
# Onde o valor é de 0.85


# Pergunta 2: 
# Existe uma correlação entre a escala de vida e a conscientização do público 
# em geral sobre a corrupção nos negócios e no governo? 
# Qual a correlação entre essas duas variáveis?

ggplot(df_mean, aes(x = IndicadorNivelVida, y = IndicadorCorrupcao)) +
  geom_point() +
  geom_smooth() +
  ggtitle('Relação entre Escala de Vida e o Indice de Corrupção') +
  labs(x = 'Escala de Vida', y = 'Indice de Corrupção')

cor.test(df_mean$IndicadorNivelVida, df_mean$IndicadorCorrupcao, method = 'pearson')

# Resposta da pergunta:

# É possível obervar uma correlação negativa, conforme aumenta a Escala de Vida,
# diminui o indice de corrupção. O valor de -0.46 da correlação corrobora com isto

## Pergunta 3: O aumento na escala de vida tem algum efeito na média de felicidade 
## entre o público em geral?
## Qual a correlação entre essas duas variáveis?

ggplot(df_mean, aes(x = IndicadorNivelVida, y = IndicadorEmocoesPositivas)) +
  geom_point() +
  geom_smooth() +
  ggtitle('Relação entre Escala de Vida e Felicidade') +
  labs(x = 'Escala de Vida', y = 'Felicidade')

cor.test(df_mean$IndicadorNivelVida, df_mean$IndicadorEmocoesPositivas)

# Resposta:
# Sim, é possível observar que conforme a Escala de Vida aumenta a Felicidade também tende
# a auemntar. Ou seja, temos uma correlação positiva, seu valor é de 0.57

## Pergunta 4: O país com o menor índice de suporte social tem maior 
## percepção de corrupção em relação às empresas e ao governo no país?

df_filter <- df_mean[df_mean$SuporteSocial == min(df_mean$SuporteSocial), ]
df_filter$SuporteSocial
df_filter$IndicadorCorrupcao
max(df_mean$IndicadorCorrupcao)

df2 <- df[df$Pais == 'Central African Republic', ]
View(df2)

ggplot(df2, aes(x = SuporteSocial, y = IndicadorEmocoesPositivas)) +
  geom_point() +
  geom_smooth() +
  ggtitle('Relação entre Suporte Social e Percepção da Corrupção') +
  labs(x = 'Suporte Social', y = 'Percepção com relação a Corrupção')

cor.test(df2$SuporteSocial, df2$IndicadorEmocoesPositivas, method = 'pearson')

# Resposta: Dificil analisar o gráfico pela pouca quantidade de dados, mas de acordo com o 
# teste de person, existe uma correlação negativa, conforme diminui o suporte social, aumenta
# a percepção com relação a corrupção

## Pergunta 5: Pessoas generosas são mais felizes?

ggplot(df_mean, aes(x = IndicadorGenerosidade, y = IndicadorEmocoesPositivas)) +
  geom_point() +
  geom_smooth() +
  ggtitle('Relação entre a Generosidade e a Felicidade') +
  labs(x = 'Generosidade', y = 'Felicidade')

cor.test(df_mean$IndicadorGenerosidade, df_mean$IndicadorEmocoesPositivas)

# Resposta:
# Sim, conforme a generosidade aumenta a felicidade também cresce.
getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap18")

# Lendo o dataset
df <- read.csv('dataset.csv')
View(df)

library(ggplot2)
library(dplyr)
library(sqldf)

# Respondendo perguntas de Negócio da Análise de Regressão

# 1-Qual a distribuição da idade dos pacientes que frequentam o hospital?

# Consrtuindo o histograma da variável idade

ggplot(df, aes(x = AGE)) + geom_histogram()
table(df$AGE)

## Utilizando o teste de shapiro-wilk
?shapiro.test

shapiro.test(df$AGE)

## Resposta: como o valor p é menor que 0.05, algo como (0.00000000000000000022), 
## sua distribuição não é normal, o que podemos concluir no histograma também.


# 2-Qual faixa etária tem o maior gasto total no hospital?

soma_gastos <- df %>%
  select(AGE, TOTCHG) %>%
  group_by(AGE) %>%
  summarise(soma_gastos = sum(TOTCHG)) %>%
  arrange(desc(soma_gastos))

soma_gastos[1,]

## Resposta: a faixa etária que possui maior gastos é a de 0 a 1 ano.

# Fazendo com SQL

soma_gastos_sql <- sqldf('SELECT AGE, sum(TOTCHG) as soma_gastos FROM df
                          GROUP BY (AGE)
                          ORDER BY (soma_gastos) desc
                         ')

soma_gastos_sql[1,]

# Resolvendo com aggregate
?aggregate

soma_gastos_aggregate <- aggregate(TOTCHG ~ AGE,
                                   FUN = sum,
                                   data = df)
View(soma_gastos_aggregate)

?which.max
which.max(tapply(soma_gastos_aggregate$TOTCHG,
                 soma_gastos_aggregate$TOTCHG,
                 FUN = sum))

barplot(tapply(soma_gastos_aggregate$TOTCHG,
               soma_gastos_aggregate$AGE,
               FUN = sum))

# 3-Qual grupo baseado em diagnóstico (Aprdrg) tem o maior gasto total no hospital?

# Quantos grups de APRDG temos no dataset

table(df$APRDRG)

gasto_diagnostico <- df %>%
  select(APRDRG, TOTCHG) %>%
  group_by(APRDRG) %>%
  summarise(gasto_total = sum(TOTCHG)) %>%
  arrange(desc(gasto_total))

gasto_diagnostico[1,]

# Resolvendo com SQL

gasto_diagnostico_sql <- sqldf('SELECT APRDRG, sum(TOTCHG) as gasto_total FROM df
                               GROUP BY (APRDRG)
                               ORDER BY (gasto_total) desc
                               ')
gasto_diagnostico_sql[1,]

# Resolvendo com agreggate

gasto_diagnostico_aggregate <- aggregate(TOTCHG ~ APRDRG,
                                         FUN = sum,
                                         data = df)
gasto_diagnostico_aggregate

gasto_diagnostico_aggregate[which.max(gasto_diagnostico_aggregate$TOTCHG), ]

## Resposta: O grupo por diagnóstico que mais gastou, foi o de número 640


## 4-A raça do paciente tem relação com o total gasto em internações no hospital?
?aov

# H0 - Não há relação entre as duas variáveis
# H1 - Há relação entre as duas variáveis

result <- aov(TOTCHG ~ RACE, data = df)
result
summary(result)

# Como o valor p é maior que 0.05 (é de 0.686), falhamos em rejeitar H0. Ou seja,
# não há relação entre as variáveis

ggplot(df, aes(x = RACE, y = TOTCHG)) + geom_point()

# 5- A combinação de idade e gênero dos pacientes influencia no gasto total em 
# internações no hospital?

# H0 - Não há relação entre as duas variáveis
# H1 - Há relação entre as duas variáveis

result <- aov(TOTCHG ~ AGE + FEMALE, data = df)
result
summary(result)

# Ambas as variáveis apresentam o  valor p abaixo de 0.05, ou seja, rejeitamos H0. Então 
# as duas variáveis influenciam no gasto total.


# 6- Como o tempo de permanência é o fator crucial para pacientes internados, 
# desejamos descobrir se o tempo de permanência pode ser previsto a partir de idade, 
# gênero e raça

# H0 - Não há relação entre as variáveis 
# H1 - Há relação linear entre as variáveis

result <- lm(LOS ~ AGE +
               FEMALE +
               RACE,
             data = df)

summary(result)

# Resposta: Como o p value foi maior que 0.05 nas tres variaveis,
# então falhamos em rejeitar H0. 
# Ou seja, não há relação entre as variáveis e o tempo de internação não pode ser previsto 
# a partir das variáveis independentes usadas


# 7- Qual variáveis tem maior impacto nos custos de internação hospitalar?

# H0 - Não há relação entre as variáveis 
# H1 - Há relação linear entre as variáveis

result <- lm(TOTCHG ~ AGE +
               FEMALE +
               LOS +
               RACE +
               APRDRG,
             data = df)

summary(result)

# Resposta: Race e Female tiveram p value maior que 0.05, onde falhamos em rejeitar H0, 
# ou seja, estas duas varíaveis não impactam nos custos.
# A variável que teve p value menor foi AGE, então esta é a que mais impacta nos gastos totais

# Verificando o modelo sem Race e Female
result_2 <- lm(TOTCHG ~ AGE +
                 LOS +
                 APRDRG,
               data = df)
summary(result_2)

# Verificando removendo do modelo a variavel APRDRG que tem t value negativo
result_3 <- lm(TOTCHG ~ AGE +
                 LOS,
               data = df)
summary(result_3)

# Resposta: como é possível analisar nos modelos construídos acima, os custos totais
# dependem das variáveis idade, tempo de internação e grupo de diagnóstico
# Essas 3 variáveis são as mais importantes para explicar e prever o gasto com internações
# hospitalares.



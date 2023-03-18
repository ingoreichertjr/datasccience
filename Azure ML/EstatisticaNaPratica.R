# Estatística na Prática - O que fazer quando a suposição do teste estatístico
# não é satisfeita?

# Há diferença significativa no crescimento dos dentes de acordo com o tipo de 
# suplemento usado nos Porcos da Guiné?

# Install and Imports
install.packages('GGally')

library(ggplot2)
library(GGally)

# Compreendendo o dataset
?ToothGrowth

# Carregando o dataset
data('ToothGrowth')
View(ToothGrowth)
str(ToothGrowth)
dim(ToothGrowth)
summary(ToothGrowth)

# Histograma
hist(ToothGrowth$len)

# GGpairs
ggpairs(ToothGrowth)

# Boxplot por tipo de suplemento
qplot(supp,
      len,
      data = ToothGrowth,
      main = 'Crescimento dos Dentes dos Porcos da Guiné por Suplemento',
      xlab = 'Tipo de Suplemento',
      ylab = 'Comprimento do Dente') +
  geom_boxplot(aes(fill = supp))

# Analisando os boxplots parece haver uma diferença no crescimento dos dentes,
# associada ao tipo de suplmento. Precisamos validar.

# Há diferença significativa no crescimento dos dentes de acordo com o tipo de
# de suplemento usados nos Porcos da Guiné?

### Testes Estatístcos escolhidos

# Coeficiente de correlação de Pearson
# Regressão linear simples

## Quanti x Quanti
## São utilizados geralmente em estudos que relacionam o quanto o incremento 
## ou o decremento no valor de uma variável afeta outra varável quantitativa

# Teste T
# ANOVA

## Quanti x Quali
## Comparação de grupos em estudos observacionais e em ensaios clínicos
## randomizados (comparações de médias finais ou de deltas)

# Shapiro-Wilk

## Descrição de varáveis contínuas
## Praticamente todos os estudos quantitativos


## Execuções dos Testes

# Primeiro teste: Teste T para Duas Amostras
## Teste paramétrico usado para tester se as médias populacionais desconhecidas de dois grupos
## são iguais ou não

# Hipótese nula (H0): não há diferença significativa na média dos 2 grupos

?t.test

vector_vc <- ToothGrowth[ToothGrowth$supp == 'VC', ]
vector_vc
vector_oj <- ToothGrowth[ToothGrowth$supp == 'OJ', ]

Teste_T <- t.test(x = vector_vc$len,
                  y = vector_oj$len)

print(Teste_T)
# O resultado de p-value = 0.06063
# Como o valor p foi maior que 0.05 nós falhamos em rejeitar H0, ou seja, 
# não há diferença significativa entre as médias.


## Segundo Teste: ANOVA
# Teste não parmétrico usado para testear se duas médias populacionais são iguais ou não.
# Hipótese nula (H0): os dois grupos possuem médias iguais

?aov

teste_anova <- aov(len ~ .,
                   data = ToothGrowth)

print(teste_anova)
summary(teste_anova)
# O resultado de p-value foi abaixo de 0.05
# Neste caso rejeitamos H0. Ou seja, os dois grupos não possuem médias iguais

## Terceiro Teste: Sahpiro Wilk
# Teste não paramétrico utilizado para validar se uma amostra de dados segue uma distribuição normal.
# Hipótese nula (H0): a amostra segue uma distribuição normal

?shapiro.test

teste_shapiro_vc <- shapiro.test(vector_vc$len)
print(teste_shapiro_vc)

teste_shapiro_oj <- shapiro.test(vector_oj$len)
print(teste_shapiro_oj)

# O valor de p da amostra com suplemento VC é de 0.4284, maior que 0.05
# Neste caso falhamos em rejeitar H0, ou seja esta amostra segue uma distribuição normal

# O valor de p da amostra com suplemento OJ é de 0.02359, menor que 0.05
# Neste caso rejeitamos H0, ou seja estamos não segue uma distribuição normal

## Quarto Teste: Teste F
# H0 = As médias dos dados extraídos de uma população normalmente distribuida tem a mesma variância

teste_F <- var.test(len ~ supp, data = ToothGrowth)
teste_F

# Valor p é de 0.2331, maior que 0.05. Por isso falhamos em rejeitar H0, ou seja, ou seja
# não há diferença significativa entra a variância dos 2 grupos

## CORREÇÃO

# Solução 1: Aplicar o Teste T para verificar se os tipos de suplementos tem impacto
# no crescimento dos dentes animais. 

# H0 - hão há diferença significativa entre a média dos dois grupos
# (o tipo de suplemento não tem impacto no crescimento dos dentes)
# H1 - Há diferença significativa entra a média dos dois grupos 
# (o tipo de suplemento tem impacto no crescimento dos dentes)

# Para aplica-lo precisamos validar as 5 suposições do Teste

# 1 - Os dados são aleatórios e representativos da população
# 2 - A variável dependente é contínua
# 3 - Ambos os grupos são independentes 
# 4 - Os resíduos do modelo são normalmente distribuidos
# 5 - A variância residual é homogenea (princípio da da homocedasticidade)

## Neste exemplo vamos considerar as suposições da 1 a 3 como verdadeiras.
## Valodar a 4 com shapiro wilk e a 5 com Teste F

# Normalmente se começa com o teste para analisar a normalidade da distribuição dos dados (shapiro)
# caso ela seja rejeitado, já não temos como aplicar o Teste T. E só com ela podemos utilizar
# testes estatísticos paramétricos

# Meus testes acima do shapiro wilk estão corretos, inclusive a sepração das variáveis
# Como o resultado de um grupo é menor que 0.05 e nós rejeitamos H0, não podemos usar o Teste T,
# pois a 4 condição não é atendida

# AGORA PODEMOS USAR UM TESTE NÃO PARAMÉTRICO, POIS ELES NÃO FAZEM SUPOSIÇÕES SOBRE OS DADOS

# VAMOS QUESTIONAR O PROBLEMA DE NEGÓCIO INICIAL E REFORMULÁ-LO
# HÁ DIFERENÇA SIGNIFICATIVA NO CRESCIMENTO DOS DENTES DE ACORDO COM O TIPO DE SUPLEMENTO USADO
# NOS PORCOS DA GUINÉ?

# Usar teste ANOVA como usei acima, pois ele não é paramétrico, suposições para usar o teste:

# 1 - Dentro de cada amostra as observações são amostradas aleatoriamente e indepentende umas das outras
# 2 - Cada amostra de grupo é extraída de uma população normalmente distribuída

# consideramos a suposição 1 como verdadeira e testamos a 2 com shapiro wilk

dose_0.5 <- ToothGrowth[ToothGrowth$dose == 0.5, ]
dose_1.0 <- ToothGrowth[ToothGrowth$dose == 1.0, ]
dose_2.0 <- ToothGrowth[ToothGrowth$dose == 2.0, ]

shapiro.test(dose_0.5$len)
shapiro.test(dose_1.0$len)
shapiro.test(dose_2.0$len)

# Todos os resultados  tiveram p maiores que 0.05. Logo falhamos em rejeitar H0 em todos os casos
# Ou seja, todas as categorias de doses são normalmente distribuidas e agora eu posso aplicar o teste ANOVA

teste_anova <- aov(len ~ dose,
                   data = ToothGrowth)

print(teste_anova)
summary(teste_anova)

# Como a variável dose possui *** ela impacta diretamente no target (variável len)
# Ou seja, não é o tipo de suplemento, mas sim a quantidade da dose que interfere diretamente
# no crescimento dos dentes

# Podemos validar isso com um modelo de regressão linear

modelo_lr = lm(len ~ supp + dose, ToothGrowth)
summary(modelo_lr)
# Veja como a dosagem é *** e o suplemento **
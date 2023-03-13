# Covariância e Coeficiente de Correlação

## Covariância ##
# A covariância é a medida de variabilidade conjunta de duas variáveis aleatórias
# Quando a covariância é positiva os dados apresentam tendência positiva na dispersão
# Quanto o valor da dovariância é negativo, os dados apresentam tendências negativas

# Especificamente, a covariância mede o grau em que duas variáveis estão linearmente associadas.

## Coeficenete de Correlação ##

# Correlação é uma versão em escala de covariânci que assume valores entre [-1,1]
# com uma correação de +- 1 indicando associação linear perfeita (positiva ou negativa) 
# e 0 indicando nenhuma relação lienar

# Para p = -1 indica uma forte correlação negativa: toda vez que x aumenta y diminui
# Para p = 0 não há nenhuma associação entre as duas variáveis
# Para +1 indica forte correlação positiva: tuoda vez que x aumenta y aumenta

# Exemplo: analisar a covariância e correlação entre as variáveis milhas/galão e peso do veículo no mtcars

install.packages("ggpubr")
library('ggpubr')

my_data <- mtcars
View(my_data)

ggscatter(my_data, x = 'mpg', y = 'wt',
          add = 'reg.line', conf.int = TRUE,
          cor.coef = TRUE, cor.method = 'pearson',
          xlab = 'Autonomia', ylab = 'Peso do Ceículo')

# Definindo x e y
x = my_data$mpg
y = my_data$wt

# Covariância
cov(x, y)

# Correlação
 
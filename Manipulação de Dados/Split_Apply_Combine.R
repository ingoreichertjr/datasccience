# Split-Apply-Combine - plyr

# Instalando os pacotes
install.packages('plyr')
install.packages('gapminder')

library(plyr)
library(gapminder)
?gapminder
View(gapminder)

# Split-Apply-Combine
?ddply
df <- ddply(gapminder, ~ continent,
            summarize,
            max_le = max(lifeExp))
str(df)
head(df)
View(df)
levels(df$continent)

# Mais um exemplo
ddply(gapminder, ~ continent,
      summarize,
      n_uniq_countries = length(unique(country)))

ddply(gapminder, ~ continent,
      function(x) c(n_uniq_countries = length(unique(x$country))))
                    
ddply(gapminder, ~ continent,
      summarize,
      min = min(lifeExp),
      max = max(lifeExp),
      median = median(gdpPercap))

# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)
View(mpg)
?mpg

# Trabalhando com um subset do dataset
data <- mpg[,c(1,7:9)]
str(data)
View(data)

# Sumarizando e Agregando Dados
ddply(data, .(manufacturer),
      summarize,
      avgtcy = mean(cty))

# Várias funções em uma única chamada
ddply(data, .(manufacturer),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty), # Desvio padrão
      maxhwy = max(hwy))

# Sumarizando os dados pela combinação de variáveis/fatores
ddply(data, .(manufacturer, drv),
      summarize,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))
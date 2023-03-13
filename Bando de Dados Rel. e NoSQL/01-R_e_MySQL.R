# Carregando e Analisando Dados do MySQL com linguagem R

getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap06")

install.packages('RMySQL')
install.packages('ggplot2')
install.packages('dbplyr')
library(RMySQL)
library(ggplot2)
library(dplyr)

?dbConnect
con = dbConnect(MySQL(), user = 'root', password = 'ingoreijr150190In!', dbname = 'titanicDB', host = 'localhost')

qry <- 'select pclass, survived, avg(age) as media_idade from titanic where survived = 1 group by pclass, survived;'
dbGetQuery(con, qry)

# Plot 
dados <- dbGetQuery(con, qry)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) + geom_bar(stat = 'identity')

# Conectando o MySQL com dplyr
?src_mysql
con2 <- src_mysql(dbname = 'titanicDB', user = 'root', password = 'ingoreijr150190In!', host = 'localhost')

# Coletando e agrupando os dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  select(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()

head(dados2)

# Manipulando dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect()

View(dados2)

# Plot 
ggplot(dados2, aes(pclass, survival_ratio, color=sex, group=sex)) +
  geom_point(size=3) + geom_line()

# Sumarizando os dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  filter(fare > 150) %>%
  select(pclass, sex, age, fare) %>%
  group_by(pclass, sex) %>%
  summarise(avg_age = avg(age),
            avg_free = avg(fare))

head(dados2)
getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap03")

# Busca os pacotes carregaos
search()

# Instala e carrega os pacotes
install.packages(c('ggvis', 'tm', 'dplyr'))
library(ggvis)
library(tm)
require(dplyr)

search()
?require
detach(package:dplyr)

# Lista o conteúdo dos pacotes
?ls
ls(pos = 'package:dplyr')
ls(getNamespace('dplyr'), all.names = TRUE)

# Lista as funções de um pacote
lsf.str('package:dplyr')
lsf.str('package:ggplot2')
library(ggplot2)
lsf.str('package:ggplot2')

# R possui um conjunto de datasets preinstalados

library(MASS)
data()

?lynx
head(lynx)
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length
sum(Sepal.Length)

?attach
attach(iris)
sum(Sepal.Length)
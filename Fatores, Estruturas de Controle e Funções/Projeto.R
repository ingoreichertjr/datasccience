# Analisando a Temperatura Média nas Cidades Brasileiras

setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap03")
getwd()

# Fazendo instalação e leitura dos pacotes
install.packages('readr')
install.packages('data.table')
install.packages('dplyr')
install.packages('ggplot2')
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

# Usando read_csv()
system.time(df <- read.csv('TemperaturasGlobais.csv'))
df

# Usando read_table()
system.time(df2 <- read.table('TemperaturasGlobais.csv'))
df2

# Usando fread()
?fread
system.time(df3 <- fread('TemperaturasGlobais.csv'))

# Fazendo subsets
cidadesBrasil <- subset(df3, Country == 'Brazil')
cidadesBrasil
dim(cidadesBrasil)

cidadesBrasil <- na.omit(cidadesBrasil)
dim(cidadesBrasil)
View(cidadesBrasil)

# Preparação e Organização

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt,format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)

# Carregando os subsets para 3 cidades

# Palmas
plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796, 1846, 1946, 1996, 2012))

# Curitiba
ctr <- subset(cidadesBrasil, City == 'Curitiba')
ctr <- subset(plm, Year %in% c(1796, 1846, 1946, 1996, 2012))

# Recife
rcf <- subset(cidadesBrasil, City == 'Recife')
rcf <- subset(plm, Year %in% c(1796, 1846, 1946, 1996, 2012))
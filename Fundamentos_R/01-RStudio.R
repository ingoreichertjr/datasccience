# Primeiros passos na Linguagem R

getwd()
# Posso utilizar o setwd() passando o path que eu quero trabalhar
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap02")

# Nome dos Contributors
contributors()

# Licença
license()

# Informações sobre a sessão
sessionInfo()

# Imprimindo uma mensagem na tela
print('O Nico é fera')

# Criar gráficos
plot(1:500)

# Instalar pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('devtools')

# Carregar o pacote
library(ggplot2)

# Descarregar o pacote
detach(package:ggplot2)

# Help sabendo o nome da função
help(mean)
?mean

# Para buscar mais opções sobre uma função, use o pacote SOS
install.packages('sos')
library(sos)
findFn('fread')

# Se não souber o nome da função
help.search('randomForest')
help.search('matplot')
??matplot
RSiteSearch('matplot')

# Sair
q()
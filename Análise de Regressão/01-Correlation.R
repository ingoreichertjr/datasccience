# Variável que controla a execução do script
Azure <- FALSE

if(Azure){
  source('src/Tools.R')
  bikes <- maml.mapInputPort(1)
  bikes$dteday <- set.asPOSIXct(bikes)
}else{
  bikes <- bikes
}

View(bikes)

# Definindo as colunas para a análise de correlação
cols <- c('mnth', 'hr', 'holiday', 'workingday', 
          'weathersit', 'temp', 'hum', 'windspeed',
          'isWorking', 'monthCount', 'dayWeek', 
          'workTime', 'xformHr', 'cnt')

# Métodos de Correlação
# Pearson - coeficiente usado para medir o grau de relacionamento entre duas variáveis com relação linear
# Spearman - teste não paramétrico, para medir o grau de relacionamento entre duas variáveis
# Kendall - teste não paramétrico, para medir a força de dependência entre duas variáveis

# Vetor com os métodos de correlação
metodos <- c('pearson', 'spearman')

# Aplicando os métodos de correlação com a funlão cor()
cors <- lapply(metodos, function(method)
  (cor(bikes[, cols], method = method)))

head(cors)

# Preparando o plot
require(lattice)
plot.cors <- function(x, labs){
  diag(x) <- 0.0
  plot( levelplot(x,
                  main = paste('Plot de Correlação usando Método', labs),
                  scales = list(x = list(rot = 90), cex = 1.0)) )
}

# Mapa de Correlação
Map(plot.cors, cors, metodos)
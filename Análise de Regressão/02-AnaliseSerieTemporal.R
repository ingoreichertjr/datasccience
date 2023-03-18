# Variável que controla a execução do script
Azure <- FALSE

if(Azure){
  sourse('src/Tools.R')
  Bikes <- maml.mapInputPort(1)
  Bikes$dteday <- set.asPOSIXct(Bikes)
}else{
  bikes <- bikes
}

# Avaliando a demanda por aluguel de bikes ao longo do tempo
# Construindo um time series plot para alguns determinados horários
# em dias úteis e dias de fim de semana.
times <- c(7, 9, 12, 15, 18, 20, 22)

# Time Series Plot
tms.plot <- function(times){
  ggplot(bikes[bikes$workTime == times, ], aes(x = dteday, y = cnt)) +
    geom_line() +
    ylab('Número de Bikes') +
    labs(title = paste('Demanda de Bikes as ', as.character(times), ':00', sep = '')) +
    theme(text = element_text(size = 20))
}

require(ggplot2)
lapply(times, tms.plot)

# Gera a saída do Azure ML
if(Azure) maml.mapOutputPort('bikes')

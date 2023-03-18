# Variável que controla a execução do script
Azure <- FALSE

if(Azure){
  source('src/Tools.R')
  Bikes <- maml.mapInputPort(1)
  Bikes$dteday <- set.asPOSIXct(Bikes)
}else{
  bikes <- bikes
}

# Convertendo a variável dayweek para fator ordenado e pltando em ordem de tempo
bikes$dayWeek <- fact.conv(bikes$dayWeek)

# Demanda de bikes x potenciais variáveis preditoras
labels <- list('Boxplots - Demanda de Bikes por Hora',
               'Boxplots - Demanda de Bikes por Estação',
               'Boxplots - Demanda de Bikes por Dia Útil',
               'Boxplots - Demanda de Bikes por Dia da Semana')

xAxis <- list('hr', 'weathersit', 'isWorking', 'dayWeek')

# Função para criar os boxplots
plot.boxes <- function(X, label){
  ggplot(bikes, aes_string(x = X, y = 'cnt', group = X)) +
    geom_boxplot() + ggtitle(label) +
    theme(text = element_text(size = 18))
}

Map(plot.boxes, xAxis, labels)

# Gera saída no Azure ML
if(Azure) maml.mapOutputPort('bikes')
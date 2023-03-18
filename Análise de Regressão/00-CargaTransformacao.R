# Configurando o diretório de trabalho
setwd('/home/ingo/DSC/FCD/BigDataRAzure/Cap14/Projeto')
getwd()

# Variável que controla e execução do script
Azure <- FALSE

# Execução de acordo com o valor da variável Azure
if(Azure){
  source('src/Tools.R')
  bikes <- maml.mapInputPort(1)
  bikes$dteday <-set.asPOSIXct(bikes)
}else{
  source('src/Tools.R')
  bikes <- read.csv("bikes.csv", sep = ",", header = TRUE, stringsAsFactors = FALSE)
  
  # Selecionar as variáveis que serão usadas
  cols <- c('dteday', 'mnth', 'hr', 'holiday',
            'workingday', 'weathersit', 'temp',
            'hum', 'windspeed', 'cnt')
  
  # Criando um subset dos dados
  bikes <- bikes[, cols]
  
  # Transformar o objeto de data
  bikes$dteday <- char.toPOSIXct(bikes)
  sum(is.na(bikes$dteday))
  # Esta linha acima gera dois valores NA
  # Corrigindo valores NA
  bikes <- na.omit(bikes)
  
  # Normalizat as variaveis preditoras numéricas
  cols <- c('temp', 'hum', 'windspeed')
  bikes[, cols] <- scale(bikes[, cols])
}

str(bikes)
View(bikes)

# Criar uma nova variável para indicar dia da semana (workday)
bikes$isWorking <- ifelse(bikes$workingday & !bikes$holiday, 1, 0)

# Adicionar uma coluna com a quantidade de meses, o que vai ajudar a criar o modelo
bikes <- month.count(bikes)

# Criar um fator ordenado para o dia da semana, começando por segunda-feira
# Neste fator é convertido para ordenado numérico para ser compatível com os tipos de dados
bikes$dayWeek <- as.factor(weekdays(bikes$dteday))

# Convertendo a nova variável de string para numerical
bikes$dayWeek <- as.numeric(ordered(bikes$dayWeek,
                            levels = c('segunda',
                                       'terça',
                                       'quarta',
                                       'quinta',
                                       'sexta',
                                       'sábado',
                                       'domingo')))

# Adiciona uma variável com valores únicos para o horário do dia em dias de semana e
# dias de fim de semana. Com isso diferenciamos as horas dos dias de semana, das horas em dias
# de fim de semana
bikes$workTime <- ifelse(bikes$isWorking, bikes$hr, bikes$hr + 24)

# Transforma os valores de hora na madrugada, quando a demanda por bicicletas é praticamente nula
bikes$xformHr <- ifelse(bikes$hr > 4, bikes$hr - 5, bikes$hr + 19)

# Adiciona uma variável com valores únicos para o horário do dia para dias de semana e dias de
# fim de semana
# Considerando horas da madrugada
bikes$formWorkHr <- ifelse(bikes$isWorking, bikes$xformHr, bikes$xformHr + 24)

# Gera saída no Azure ML
if(Azure) maml.mapOutputPort('bikes')
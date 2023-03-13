# Datas e Hora

getwd()

# Hora e Data do sistema
hoje <- Sys.Date()
hoje
class(hoje)
Sys.time()
Sys.timezone

# Data - representada por Date
# Armazenados como número de dias desde 1 de janeiro de 1970

# Time - representado por POSIXct
# Armazenados como números de segundos desde 1 de janeiro de 1970

# Formatando Datas
# %d: dia do mês em dois dígitos (13)
# %m: mês em 2 digitos (01)
# %y: ano em 2 dígitos (82)
# %Y: ano em 4 dígitos (1998)
# %A: dia da semana (Friday)
# %a: dia da semana abreviado (Fri)
# %B: mês (July)
# %b: mês abreviado (Jul)

# Formatando hora
# %H: hora (00-23)
# %M: minuto
# #S: segundo
# %T: formado reduzido para %H:%M:%S
?strptime

# Formatando a saída - as.Data()
as.Date('2018-06-28') # string
as.Date('Jun-28-18', format = '%b-%d-%y') # data
as.Date('28 June, 2018', format = '%d %B, %Y')

# Função format()
Sys.Date() # Data atual
format(Sys.Date(), format = '%d %B, %Y')
format(Sys.Date(), format = 'Hoje é %A!')

# Convertendo Datas - as.POSIXct (numero de segundos deste 01/01/1970)
date1 <- "Jun 13, '96 hours:23 minutes:01 seconds:45"
date1_convert <- as.POSIXct(date1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
date1_convert

# Operações com Datas
data_de_hoje <- as.Date('2016-06-25', format = '%Y-%m-%d')
data_de_hoje
data_de_hoje + 1

my_time <- as.POSIXct('2016-05-14 11:24:134')
my_time
my_time + 1

data_de_hoje - as.Date(my_time) # estão no mesmo formato, Date
data_de_hoje - my_time # não estão no mesmo formato, uma está Date e outra POSIXct

# Convertendo Data em formato específico
# Vetor com número de dias, segundos ou minutos:
dts = c(789456130, 3216549879, 7413698520, 9658741235)
mydates = dts

# POSIXct, armazena os segundos desde uma data específica, 
# convertendo os valores numéricos (que podem representar horas, minutos ou segundos) desde 01 de janeiro de 1970
# POISXt é a classe principal e POSIXct e POSIXlt são subclasses.
# Poderíamos usar aqui apenas POSIXct, que é a subclasse (mas não podemos usar apenas a classe principal)
class(mydates) = c('POSIXt', 'POSIXct')
mydates
class(mydates) # Tenho a classe principal e a sub classe, formato padrão para ser usado!
# Tentar sempre usar POSIXct, ele resolve a grande maioria dos casos

mydates = structure(dts, class = c('POSIXt', 'POSIXct')) # função strucutre faz basicamente a mesma coisa
mydates

# Função ISODate
b1 = ISOdate(2011, 3, 23)
b1
b2 = ISOdate(2012, 9, 19)
b2
b2 - b1

difftime(b2, b1, units = 'weeks')

# Pacote lubridate
?lubridate
install.packages('lubridate')
require(lubridate)

ymd('20180604')
mdy('06-04-2018')
dmy('04/06/2018')

chegada <- ymd_hms('2016-06-04 12:00:00', tz = 'Pacific/Auckland')
partida <- ymd_hms('2011-08-10 14:00:00', tz = 'Pacific/Auckland')

chegada
partida

second(chegada)
second(chegada) <- 23
chegada
wday(chegada) # week day, dia da semana
wday(chegada, label = TRUE)
class(chegada)

# Cria um objeto que especifica a data de ínicio e data de fim
interval(chegada, partida)

tm1.lub <- ymd_hms('2020-05-24 23:55:26')
tm1.lub

tm2.lub <- mdy_hm('05/05/20 08:32')
tm2.lub

year(tm1.lub)
week(tm1.lub)

tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600
tm1.dechr
force_tz(tm1.lub, 'Pacific/Auckland')

# Gerando um dataframe de datas
# Copiar do outro arquivo
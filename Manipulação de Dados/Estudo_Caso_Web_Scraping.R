# Estudo de Caso - Extraindo Dados da Web com Web Scraping em R

# Web Crawling - "rastejar" por uma web page ou site buscando dados
# Web Scraping - "raspar" os dados de uma web page

getwd()

# Pacotes R para Web Scraping
# RCurl
# httr
# XML
# rvest

# Pacote rvest - útil para quem não conhece HTML e CSS
install.packages('rvest')
library(rvest)

library(stringr)
library(dplyr)
library(lubridate)
library(readr)

# Leitura da web page - Retorna um documento xml
webpage <- read_html('https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html')
webpage

# Extraindo os registros 
?html_nodes
results <- webpage %>% html_nodes('.short-desc') # Está buscando pela class 'short-desc' do CSS
results

# Construindo o dataset
records <- vector('list', length = length(results))
records

for (i in seq_along(results)) {
  data <- str_c(results[i] %>%
                  html_nodes('strong') %>%
                  html_text(trim = TRUE), ', 2017') # Extraimos a data, trim remove os espaços
  
  lie <- str_sub(xml_contents(results[i])[2] %>% html_text(trim = TRUE), 2, -2) # Extraimos o texto da mentira
  
  explanation <- str_sub(results[i] %>%
                           html_nodes('.short-truth') %>% # Extraimos a explicação, atenção para a classe utilizada
                           html_text(trim = TRUE), 2, -2)
  
  url <- results[i] %>% html_nodes('a') %>% html_attr('href') # Extraimos tudo que é link
  
  records[[i]] <- data.frame(date = date, lie = lie, explatanation = explanation, url = url) # Colcoamos tudo em data frame
}

# Dataset Final
df <- bind_rows(records)

# Transformando o campo data para o formato Date em R
df$date <- mdy(df$date)

# Exportando pra CSV
write_csv(df, 'mentiras_trump.csv')

# Lendo os dados
df <- read_csv('mentiras_trump.csv')
View(df)
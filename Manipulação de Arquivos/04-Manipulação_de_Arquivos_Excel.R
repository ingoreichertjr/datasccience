getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap05")

# Manipulação de arquivos excel

# Instalando o pacote
install.packages('readxl')
library(readxl)

# Lista as worksheet no arquivo Excel
excel_sheets('PopUrbana.xlsx')

# Lendo a planilha da Excel
read_excel('PopUrbana.xlsx')
View(read_excel('PopUrbana.xlsx'))
read_excel('PopUrbana.xlsx', sheet = 'Period2')
read_excel('PopUrbana.xlsx', sheet = 3)
read_excel('PopUrbana.xlsx', sheet = 4)

# Importando uma worksheet para um dataframe
df <- read_excel('PopUrbana.xlsx', sheet = 3)
View(df)

# Importando todos os worksheets
df_todas <- lapply(excel_sheets('PopUrbana.xlsx'), read_excel, path = 'PopUrbana.xlsx')
class(df_todas)
View(df_todas)
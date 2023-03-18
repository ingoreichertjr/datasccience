# Manipulação de Arquivos JSON

getwd()

# Instala o pacote
install.packages('rjson')

# Carrega o pacote
library('rjson')

# Carrega o arquivo 
resultado <- fromJSON(file = 'funcionarios.json')

# Visualiza
print(resultado)

# Carrega com dataframe
json_data_frame <- as.data.frame(resultado)

# Visualiza
print(json_data_frame)
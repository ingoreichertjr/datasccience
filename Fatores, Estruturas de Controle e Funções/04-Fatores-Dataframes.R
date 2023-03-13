# Fatores e Dataframes

getwd()
setwd("/home/ingo/DSC/FCD/BigDataRAzure/Cap03/meus_scripts")

# Criando vetores 
vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0, 2)
vec3 <- factor(c('Verde', 'Laranja', 'Azul', 'Laranja', 'Verde'))

# Unindo os vetores em um datagrame
df <- data.frame(vec1, vec2, vec3)
df

# Verificando que o R categorizou a ultima coluna como fator
str(df)

# Verificando os níveis do fator. Os níveis estão categorizados
levels(df$vec3)

# Criando uma outra coluna e atribuindo labels. Ela é uma transformação da vec3
df$cat1 <- factor(df$vec3, labels = c('cor2', 'cor1', 'cor3'))
df

# Veja como a ordenação seguiu a ordem alfabetica do vec3:
# Azul = cor2
# Laranja = cor1
# verde = cor3

# Criando uma outra coluna e atribuindo labels baseado na vec2
df$cat2 <- factor(df$vec2, labels = c('Solteiro', 'Casado', 'Divorciado'))
df
levels(df$cat2)
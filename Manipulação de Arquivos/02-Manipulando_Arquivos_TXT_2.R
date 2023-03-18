# Trabalhando com Arquivos txt - Parte 2

?read.table
?write.table # Grava em disco

# Gerando arquivo
write.table(mtcars, file = 'mtcars.txt')
dir()

df_mtcars <- read.table('mtcars.txt')
View(df_mtcars)
dim(df_mtcars)

write.table(mtcars, file = 'mtcars.txt', sep = '|', col.names = NA, qmethod = 'double')
list.files()

df_mtcars2 <- read.table('mtcars.txt')
View(df_mtcars2)

df_mtcars2 <- read.table('mtcars.txt', sep = '|')
View(df_mtcars2)

df_mtcars2 <- read.table('mtcars.txt', sep = '|', header = TRUE, encoding = 'UTF-8')
View(df_mtcars2)
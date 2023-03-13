# Expressoes Regulares

getwd()

# Expressores regulares que podemos usar:
# grep
# grepl
# sub
# gsub
# regexpr
# gregexpr

str <- c('Expressẽs', 'regulares', 'em lingugem R',
         'permitem a busca de padrões', 'a exploração de textos',
         'podemos buscar padrões em dígitos',
         'como por exemplo',
         '10992451280')

length(str)
str

# grep()
?grep
grep('ex', str, value = F) # mostra a posição
grep('ex', str, value = T) # mostra a palavra
grep('\\d', str, value = F)
grep('\\d', str, value = T)

# grepl() Retorna True ou False
?grepl
grepl('\\d+', str)
grepl('\\D', str)

# gsub() Substitui o padrão encontrado
?gsub
gsub('em', '***', str)
gsub('ex', 'EX', str, ignore.case = T)

# sub()
sub('em', 'EM', str)

# regexpr() Mostra a posição e a quantidade
frase <- 'Isso é uma string.'
regexpr(pattern = 's', frase)

# gregexpr()
gregexpr(pattern = 'u', frase)

str2 <- c('2678 é maior que 45 - @???!$$$', 'vamos escrever 14 scripts R')

str2

# gsub()
gsub('\\d', '', str2)
gsub('\\D', '', str2)
gsub('\\s', '', str2)
gsub('[iot]', 'Q', str2)
gsub('[[:punct:]]', '', str2)



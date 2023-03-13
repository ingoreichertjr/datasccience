# Interpretando um Histograma

## Histograma

# Representa uma distribuição de frequências, onde é possivel a sua contabilização

dados = c(18, 22, 32, 56, 78, 15, 46, 89, 36, 11, 23, 45, 89, 65, 45, 35, 79, 37, 19,
          35, 74, 69, 23, 21, 20, 80, 17, 35, 68, 78, 36, 15, 98, 78, 19, 35, 15, 78, 
          78, 98, 16, 68, 15, 68, 32, 16, 99, 59, 23)

dados <- sort(dados)
df <- data.frame(dados)
df

?geom_histogram

ggplot(df, aes(x = dados, colour = 'red', fill = 'red')) +
  geom_histogram() +
  scale_x_continuous(breaks = seq(0, 100, 5)) + 
  stat_bin(geom='text', aes(label=..count..), position=position_stack(vjust = 0.5))

# Com o pacote que vem no R

hist(dados, main = 'Números Alternativos', xlab = 'Acidentes', ylab = 'Frequência')
hist(dados, main = 'Números Alternativos', xlab = 'Acidentes', ylab = 'Frequência', breaks = 6)
hist(dados, main = 'Números Alternativos', xlab = 'Acidentes', ylab = 'Frequência', breaks = 5)

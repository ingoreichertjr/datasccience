# Graficos de Pizza

?pie

# Criando as fatias
fatias = c(40, 20, 40)

# Noemando os labels
paises = c('Brasil', 'Argentina', 'Chile')

# Unindo paises e fatias
paises = paste(paises, fatias)

# Incluindo mais detalhes no label
paises = paste(paises, '%', sep = '')

# Construindo um gráfico
pie(fatias, labels = paises,
    col = c('darksalmon', 'gainsboro', 'lemonchiffon4'),
    main = 'Distribuição de Vendas')

# Trabalhando com dataframes
?iris
attach(iris)
values = table(Species)
labels = paste(names(values))
pie(values, labels = labels, main = 'Distribuição de Espécies')


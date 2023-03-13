# Analise Exploratoria

# Variavel que controla a execução do script
Azure <- FALSE

if(Azure){
  source('src/ClassTools.R')
  Credit <- maml.mapInputPort(1)
}

# Plots usando o ggplot2
library(ggplot2)
lapply(colNames2, function(x){
  if(is.factor(Credit[,x])) {
    ggplot(Credit, aes_string(x)) +
      geom_bar() +
      facet_grid(. ~ CreditStatus) +
      ggtitle(paste('Total de Credito Bom/Ruim por', x))
  }
})

# Plots CreditStatus vs CheckingAcctStat
lapply(colNames2, function(x){
  if(is.factor(Credit[,x]) & x != 'CheckingAcctStat') {
    ggplot(Credit, aes(CheckingAcctStat)) +
      geom_bar() +
      facet_grid(paste(x, '~ CreditStatus')) +
      ggtitle(paste('Total de Credito Bom/Ruim CheckingAcctStat e', x))
  }})

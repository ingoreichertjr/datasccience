# Distribuição Poisson

getwd()

# Também utilizado para variáveis discretas

# A Distribuição Poisson é muito útil para calcular a probabilidade de um certo número de eventos
# que ocorrerá em um específico intervalo de tempo ou espaço

# Exemplo: Considere um processo que têm uma taxa de 0,5 defeitos por unidade. 
# Qual a probabilidade de uma unidade apresentar dois defeitos? E nenhum defeito?

?dpois
dpois(2, 0.5)
dpois(0, 0.5)
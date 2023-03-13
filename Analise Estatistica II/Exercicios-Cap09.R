# Solução Lista de Exercícios - Capítulo 9 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd('/home/ingo/DSC/FCD/BigDataRAzure/Cap09/26-Cap09')
getwd()


# Exercício 1 - Gere 1000 números de uma distribuição normal com média 3 e sd = .25 e grave no objeto chamado x.


# Exercício 2 - Crie o histograma dos dados gerados no item anterior e adicione uma camada com a curva da normal.



# Exercício 3 - Suponha que 80% dos adultos com alergias relatem alívio sintomático com uma medicação específica. 
# Se o medicamento é dado a 10 novos pacientes com alergias, qual é a probabilidade de que ele seja 
# eficaz em exatamente sete?



# Exercício 4 - Suponha que os resultados dos testes de um vestibular se ajustem a uma distribuição normal. 
# Além disso, a pontuação média do teste é de 72 e o desvio padrão é de 15,2. 
# Qual é a porcentagem de alunos que pontuaram 84 ou mais no exame?

# Aplicamos a função pnorm da distribuição normal com média 72 e desvio padrão 15.2. 
# Como estamos procurando a porcentagem de alunos com pontuação superior a 84, 
# estamos interessados na cauda superior da distribuição normal.



# Exercício 5 - Suponha que o tempo médio de check-out de um caixa de supermercado seja de três minutos. 
# Encontre a probabilidade de um check-out do cliente ser concluído pelo caixa em menos de dois minutos.

# A taxa de processamento de checkout é igual a uma dividida pelo tempo médio de conclusão da finalização. 
# Por isso, a taxa de processamento é de 1/3 de checkouts por minuto. 
# Em seguida, aplicamos a função pexp da distribuição exponencial com taxa = 1/3.



# Exercício 6 - Selecione dez números aleatórios entre um e três.
# Aplicamos a função de geração runif da distribuição uniforme para gerar dez números aleatórios entre um e três.



# Exercício 7 - Se houver 12 carros atravessando uma ponte por minuto, em média, 
# encontre a probabilidade de ter 15 ou mais carros cruzando a ponte em um determinado minuto.
# A probabilidade de ter 14 ou menos carros atravessando a ponte em um determinado minuto é dada pela função ppois.


# Assim, a probabilidade de ter 15 ou mais carros cruzando a ponte em um minuto está na 
# cauda superior da função de densidade de probabilidade.



# Exercício 8 - Suponha que haja 12 questões de múltipla escolha em um questionário de inglês. 
# Cada questão tem cinco respostas possíveis e apenas uma delas está correta. 
# Encontre a probabilidade de ter quatro ou menos respostas corretas se um aluno tentar 
# responder a cada pergunta aleatoriamente.
# Como apenas uma das cinco respostas possíveis está correta, a probabilidade de responder corretamente 
# a uma pergunta aleatória é 1/5 = 0,2. Podemos encontrar a probabilidade de ter exatamente 4 respostas 
# corretas por tentativas aleatórias como segue.


# Para encontrar a probabilidade de ter quatro ou menos respostas corretas por tentativas aleatórias, 
# aplicamos a função dbinom com x = 0,…, 4.







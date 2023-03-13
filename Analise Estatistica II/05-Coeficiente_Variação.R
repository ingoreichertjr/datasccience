# Medidas de Dispersão - Coeficiente de Variação

# Mede o desvio padrão em termos percentual da média.
# Um CV alto, indica alta variabilidade dos dados, ou seja, menos consistência dos dados

# Exemplo do mercado de Ações:

# Nike => Valor média da ação = $55.62 / desvio padrão = $5.10
# Adidas => Valor média da ação = $24.86 / desvio padrão = $3.60

# CV = (desvio/media) * 100

cv_nike = (5.10/55.62) * 100
cv_adidas = (3.60/24.86) * 100

print(cv_nike)
print(cv_adidas)

# Melhor comprar ações da nike pois tem um coeficiente de variação menor, mesmo tendo um desvio padrão maior

dados1 <- c(0, 5, 10)
dados2 <- c(4, 5, 6)

mean(dados1)
mean(dados2)

sd(dados1)
sd(dados2)

cv_dados1 = (5/5) * 100
cv_dados2 = (1/5) * 100

cv_dados1
cv_dados2
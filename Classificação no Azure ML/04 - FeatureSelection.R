# Feature Selection (Seleção de Variáveis)

# Variavel que controla a execução do script
Azure <- FALSE

if(Azure) {
  source('src/ClassTools.R')
  Credit <- maml.mapInputPort(1)
}

# Modelo randomForest para criar um plot de importancia das variaveis
# Exlcuindo as variaveis menos relevantes a partir da análise exploratória
library(randomForest)
modelo <- randomForest( CreditStatus ~ .
                        - Duration
                        - Age
                        - CreditAmount
                        - ForeignWorker
                        - NumberDependents
                        - Telephone 
                        - ExistingCreditsAtBank
                        - PresentResidenceTime
                        - Job
                        - Housing
                        - SexAndStatus
                        - InstallmentRatePecnt
                        - OtherDetorsGuarantors
                        - Age_f
                        - OtherInstalments,
                        data = Credit,
                        ntree = 100,
                        nodesize = 10,
                        importance = TRUE)

varImpPlot(modelo)

outFrame <- serList(list(credit.model = modelo))

# Output
if(Azure) maml.mapOutputPort('outFrame')
# Modelo de Regresi�n Multiple para predecir el precio de una casa

# Daniel Lopez
# Luis Pedro Zenteno
# Fabricio Juarez
# Andrea Reyes

# Importando Librer�as
library(corrplot)
library(readxl)
library(dplyr)

# Importando datos
kc_house_data <- read_excel("kc_house_data.xlsx")
dataset <- kc_house_data[,-c(1:2)]

# Preimera estimaci�n de regresi�n
regresion_multiple <- lm(formula = price~., data = dataset)
summary(regresion_multiple)
    # Variables muy correlacionadas
# Quitando vairables no significativas
dataset <- select(.data = dataset, -floors)
dataset <- select(.data = dataset, -sqft_basement)

regresion_multiple <- lm(formula = price~., data = dataset)
summary(regresion_multiple)

# Quitando variables con alto coef. de correlacion
dataset <- select(.data = dataset, -bathrooms)
dataset <- select(.data = dataset, -sqft_living)

regresion_multiple <- lm(formula = price~., data = dataset)
summary(regresion_multiple) # no cambia mucho al quitar esa variable

correlacion<-round(cor(dataset), 1)
correlacion
corrplot(correlacion, method="number", type="upper")
# Matriz de correlaci�n para descartar predictores correlacionados entre s�



# Regresi�n final. R^2 de ~70%
regresion_multiple <- lm(formula = price~., data = dataset)
summary(regresion_multiple)



y_pred <- predict(object = regresion_multiple, newdata = dataset[,-1])
y_pred <- as.data.frame(y_pred)
View(y_pred)


plot(regresion_multiple)







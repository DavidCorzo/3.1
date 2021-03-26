
# Importing the dataset
dataset =  read.csv('Social_Network_Ads.csv', header = TRUE, check.names = FALSE)
dataset = dataset[3:5]

# Split dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training = subset(dataset, split == TRUE)
testing = subset(dataset, split == FALSE)

training[-3] = scale(training[-3])
testing[-3] = scale(testing[-3])

# Create regressor model
regresor = glm(Purchased ~ ., 
                 data=training,
                 family = binomial)
y = predict(regresor, testing, type='response')

#install.packages('plotly')
library(ggplot2)
library(plotly)

# Define data series
u <- plot_ly(x = testing$Age, y = testing$EstimatedSalary, z = predict(regresor, testing, type = 'response'), name = 'Testing prediccion forma S')
p <- plot_ly(x = testing$Age, y = testing$EstimatedSalary, z = round(predict(regresor, testing, type = 'response')), name = 'Testing prediccion')
v <- plot_ly(x = testing$Age, y = testing$EstimatedSalary, z = testing$Purchased, name = 'Testing realidad')

# Plot data points
subplot(p, u, v)

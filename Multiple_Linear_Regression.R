# Multiple Linear Regression

dataset = read_csv("50_Startups.csv")
View(dataset)

#Encoding categorical var
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

#Fitting Multiple LR to training set
regreesor = lm(Profit ~ ., data = training_set)
summary(regreesor)

#predicting the test set results
y_pred = predict(regreesor, newdata = test_set)
y_pred


#Building the optimal model using backward elimination
regressor = lm(Profit ~ dataset$`R&D Spend` + dataset$Administration + dataset$`Marketing Spend` + dataset$State,
               data = dataset)
summary(regressor)
regressor = lm(Profit ~ dataset$`R&D Spend` + dataset$Administration + dataset$`Marketing Spend`,
               data = dataset)
summary(regressor)
regressor = lm(Profit ~ dataset$`R&D Spend`+ dataset$`Marketing Spend`,
               data = dataset)
summary(regressor)
regressor = lm(Profit ~ dataset$`R&D Spend`,
               data = dataset)
summary(regressor)
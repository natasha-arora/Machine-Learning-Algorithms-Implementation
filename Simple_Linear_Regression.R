# Simple Linear Regression

#Importing data set
dataset = read_csv("Salary_Data.csv")

#Splitting dataset into training and test
#install.packages('caTools')
library(caTools)
#to get same results we set seed
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3) #ration is for training set
split
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

#Fitting simple LR to the Training set
regreesor = lm(formula = Salary~YearsExperience, data = training_set)
summary(regreesor)

#Predicting the test set results
y_pred = predict(regreesor, newdata = test_set)

#Visualising the Training set results
library(ggplot2) #to automate library
#Steps
# 1. plot all the observations in training data set
# 2. plot the regression line - predicted values
# 3. set title
# 4. set X and Y label
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regreesor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#Visualising the Test set results
library(ggplot2) #to automate library

ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regreesor, newdata = training_set)), # dont need to replace with test
            #set becoz this prediction results are obtained from same unique reg line so ww will get the same reg line
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

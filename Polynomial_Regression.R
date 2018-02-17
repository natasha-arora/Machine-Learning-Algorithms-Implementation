# Polynomial Regression

dataset = read_csv('Position_Salaries.csv')
dataset = dataset[2:3]
View(dataset)

# Fitting LR to the dataset
lin_reg = lm(formula = Salary ~ ., data = dataset)
summary(lin_reg)

# Fitting polynomial regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ ., 
              data = dataset)
summary(poly_reg)

#Visualising the Linear regression
install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), 
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Linear Reg results)') + 
  xlab('Level') +
  ylab('Salary')

#Visualising the Polynomial regression
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), 
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Linear Reg results)') + 
  xlab('Level') +
  ylab('Salary')

# Visualising the Regression Model results (for higher resolution and smoother curve)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))


#Predicting a new result with poly R  
y_pred = predict(poly_reg, data.frame(Level = 6.5, 
                                      Level2 = 6.5^2, 
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))
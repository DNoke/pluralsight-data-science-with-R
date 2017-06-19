#*********************************************************
#File Name:   Statistical_Models.R  
#
#Author:      David Noke
#
#Description: Solving problems using statistical models
#
#Key Words: plot, model, summary, lines, cor, predict
#
#*********************************************************
#Statistical models are one or more mathematical equations
#  used to represent the sample of data.  Model of the 
#  relationship between two or more variables.
# 
#Used for:
#   Description
#   Inference
#   Comparison
#   Prediction
#
#*********************************************************
#Simple Linear Regression:
#   Relationship - how  change in one variable affects the
#       change in another variable.
#   Two variables:
#       Explanatory Variable (Independant Variable):
#         typically the x-axis
#       Outcome Variable (Dependant variable):
#         typically the y-axis
#
#   Linear equation: y = m * x + b
#       m=slope, b=y intercept
#
#*********************************************************
#Questions:
#   1: How are petal length and petal width related?
#   2: Can we predict new petal width values?
#*********************************************************
data("iris")
head(iris)

#Create scatterplot of petal length and petal width
plot(
    x = iris$Petal.Length,
    y = iris$Petal.Width,
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)")

#Create a linear regression model
model <- lm (formula = Petal.Width ~ Petal.Length,
              data = iris)

#View summary data:
#   Coefficients (Intercept) - Estimate of y intercept
#   Coefficients Petal.Length - Estimate of slope
summary(model)

#Draw linear regression on scatter plot
lines(
    x = iris$Petal.Length,
    y = model$fitted.values,
    col = "red",
    lwd = 3)

#Get the correlation coefficient
cor(x = iris$Petal.Length,
    y = iris$Petal.Width)

#Predict new values from the model
predict(
    object = model,
    newdata = data.frame(
        Petal.Length = c(2,5,7)))



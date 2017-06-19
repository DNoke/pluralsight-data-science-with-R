#*********************************************************
#File Name:   Handling_BigData.R  
#
#Author:      David Noke
#
#Description: Solving problems using techniques used
#               with Big Data.
#
#Key Words: biglm, plot, model, summary, lines, cor, predict
#
#*********************************************************
#
#  Big Data Definition:
#     Volume:  large size
#     Velocity: long time to process
#     Variety: unstructured data (text, audio, etc.)
#
#*********************************************************
#Questions:
#   1: How are petal length and petal width related?
#   2: Can we predict new petal width values?
#*********************************************************
setwd("C:/Kaggle/R Data")
library(ff)

#Read cSV file as ff data frame
#  ffdf function open pointer to file
#  rather than loading it into memory
irisff <- read.table.ffdf(
    file = "Iris.csv",
    FUN = "read.csv")

#Inspect the class
class(irisff)

#Inspect the column names
names(irisff)

#Inspect first few rows
#  cannot use head() with ddff
irisff[1:5,]

#Load the biglm package
library("biglm")

#Create a linear regression model
model <- biglm (formula = Petal.Width ~ Petal.Length,
             data = irisff)

#View summary data:
#   Coefficients (Intercept) - Estimate of y intercept
#   Coefficients Petal.Length - Estimate of slope
summary(model)

#Create scatterplot of petal length and petal width
plot(
  x = irisff$Petal.Length[],
  y = irisff$Petal.Width[],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)")

#Draw linear regression on scatter plot
#  model does not contain fitted values

#Get the y-intercept  
b <- summary(model)$mat[1,1]

#Get the slope
m <- summary(model)$mat[2,1]
  
  
lines(
  x = irisff$Petal.Length[],
  y = m * irisff$Petal.Length[] + b,
  col = "red",
  lwd = 3)

#Get the correlation coefficient
cor(x = irisff$Petal.Length[],
    y = irisff$Petal.Width[])

#Predict new values from the model
# need to add parameter Petal.Width
# to store the return values
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2,5,7),
    Petal.Width = c(0,0,0)))



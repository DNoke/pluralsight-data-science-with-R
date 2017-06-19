#*********************************************************
#File Name:   Descriptive_Statistics.R  
#
#Author:      David Noke
#
#Description: Use of various functions to 
#             gather statisical values.
#
#Key Words: table(), min(), max(), mean(), median()
#           quantile(), sd(), sum(), cor(), summary()
#           read.csv
#*********************************************************
#
#Statisical Terms:
#   Observations - rows in the table
#   Variables - columns in the table
#   Categorical Variables - qualitative values 
#        (ex: car type, transmission type
#         mostly interested in frequency)
#   Numeric variables - quantitative values
#        (ex: cylinders, fuel economy
#         interested in center of measures and spread:
#         mean, median, quartile, standard deviation)
#   Correlation - strength of relationship between 
#         two variables
#         Correlation coefficient range -1 to +1
#         0 = no correlation
#
#*********************************************************
#Questions:
#   1-How many cars of each transmission type?
#         Create a frequency tables of transmissions
#   2-What does the distribution of fuel economy look like?
#         View quantative measures such as mean, median std dev, etc
#   3-How are the number of cylinders and fuel economy related?
#         Create a correlation coefficient
#*********************************************************

#Set working directory
setwd("C:/Kaggle/R Data")

#Read a csv file
cars <- read.csv("Cars.csv")

head(cars)

#Question 1:  How many cars of each transmission type?
table(cars$Transmission)

#Question 2:  What does the distribution of fuel economy look like?
#minimum value
min(cars$Fuel.Economy)
#maximum value
max(cars$Fuel.Economy)
#mean
mean(cars$Fuel.Economy)
#median
median(cars$Fuel.Economy)
#quartiles
quantile(cars$Fuel.Economy)
#stardard devivation
sd(cars$Fuel.Economy)
#total value  
sum(cars$Fuel.Economy)

#Question 3: How are the number of cylinders and fuel economy related?
#Get correlation coefficient to see how they are related
cor (x = cars$Cylinders, y = cars$Fuel.Economy)


#Summarize all values
summary(cars)


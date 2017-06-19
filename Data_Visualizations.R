#*********************************************************
#File Name:   Data_Visualizations.R  
#
#Author:      David Noke
#
#Description: Various example of creating graphs 
#             using ggplot2.
#
#Key Words:   ggplot(), geom_bar, geom_histogram, 
#             geom_density, geom_density, geom_point
#*********************************************************
#
#Plotting Systems:
#   Base
#   Lattice
#   ggplot2
#
#*********************************************************
#Questions:
#   1-How many cars of each transmission type?
#         Frequency bar graph
#   2-What does the distribution of fuel economy look like?
#         Histogram and density plot
#   3-How are the number of cylinders and fuel economy related?
#         Scatter plot
#*********************************************************

#Set working directory
setwd("C:/Kaggle/R Data")

#Read a csv file
cars <- read.csv("Cars.csv")

#Load ggplot2 library
library("ggplot2")

#Question 1:  How many cars of each transmission type?
#Frequency bar chart
#   aes - aesthetic mappings
#   geom_bar - bar chart
#   ggtitle - chart title
#   xlab - x label
#   ylab - y label
ggplot(
    data = cars,
    aes(x = Transmission)) +
    geom_bar() + 
    ggtitle("Count of Cars by Transmission Type") +
    xlab("Transmission Type") + 
    ylab("Count of Cars")


#Question 2:  What does the distribution of fuel economy look like?
#Historgram
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_histogram(bins = 10) + 
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (MPG)") + 
  ylab("Count of Cars")

#Density plot
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_density() + 
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (MPG)") + 
  ylab("Count of Cars")

#Question 3: How are the number of cylinders and fuel economy related?
#Scatterplot
ggplot(
  data = cars,
  aes(x = Cylinders,
      y = Fuel.Economy)) +
  geom_point() + 
  ggtitle("Fuel Economy by Cylinders") +
  xlab("Number of Cylinders") + 
  ylab("Fuel Economy (MPG)")





#*********************************************************
#File Name:   Machine_Learning.R  
#
#Author:      David Noke
#
#Description: Example of supervised machine learning.
#
#Key Words: set.seed(),data(),sample(), tree(),
#           summary(),plot(),text(),brewer.pal(),
#           partition.tree(),predict(),confusionMatrix()
#
#*********************************************************
#Machine Learning:
#   Use existing data -> learn a function -> prediction
#   Best to have large amount of data.
#   Use algorithm to train a model.
#   
#   Types of Predictions:
#       1-Classification: predict qualitative values 
#       2-Regression: predict numeric or quantative values
#       3-Clustering: groups of similar observations in data 
#       4-Anomaly Detection: find outliers 
#
#   Types of Machine Learning:
#       1-Supervised: labels  are provided, machines
#             use labeled data to predict new data without 
#             labels (ex: classification and regression)
#       2-Unsupervised: no labels are provided, machines
#             learns the structure of the data or finds
#             patterns in the data (ex: clustering)
#       3-Reinforcement: machine attempts to achieve a 
#             goal in a dynamic environment.  Receives
#             reinforcement if gets closer to goal
#
#*********************************************************
#Decision Tree Classifier:
#   Supervised learning
#   Nodes and branches of decision tree created based on 
#     statistical information.
#*********************************************************
#Questions:
#   1-What is the species of iris flower based
#     on petal length, petal width, sepal length
#     and sepal width?
#
#   2-What is the predication accuarcy?
#*********************************************************


#Load the data
data(iris)

#Set a seed for randomness
#  42 is an arbitrary number
set.seed(42)

#Split data to training and test data set
# 2/3 for training
# 1/3 for testing
#
#Randomly sample 100 rows 
indexes <- sample(
              x = 1:150,
              size = 100)

print(indexes)

#Create training set from indexes
train <- iris[indexes,]

#Create test set from everything not
#   included in indexes (use minus sign)
test <- iris[-indexes,]

library(tree)

#Train a decision tree
#  We're looking for species we will
#  look to see how all other variables
#  related to species
model <- tree(
            formula = Species ~ .,
            data = train)

#Inspect the model
#  Variables used are Petal.Length and Petal.Width
#  4 terminal nodes (4 leaves)
summary(model)

#Visualize the model
plot(model)
text(model)

#Load color brewer library
library(RColorBrewer)

#Create a color palette - get 3 colors from Set2 palette
palette <- brewer.pal(3, "Set2")

#Create a scatterplot colored by species
plot(
    x = iris$Petal.Length,
    y = iris$Petal.Width,
    pch = 19,
    col = palette[as.numeric(iris$Species)],
    main = "Iris Petal Length vs. Petal Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)")

#Plot the decision boundries
partition.tree(
    tree = model,
    label = "Species",
    add = TRUE)

#Predict using the model
predictions <- predict(
                object = model,
                newdata = test,
                type = "class")

#Create a confusion matrix
#  a table that will show
#  how many were correctly 
#  classified to incorrectly 
#  classified
#  Rows = predicted species
#  Columns = correct species
#  2 versicolor were incorrecly classified
table (
        x = predictions,
        y = test$Species)

#Load caret package
library(caret)

#Evaluate the prediction results
confusionMatrix(
        data = predictions,
        reference = test$Species)

#Save data
setwd ("C:/Kaggle/R Data")
save(model, file = "Tree.RData")







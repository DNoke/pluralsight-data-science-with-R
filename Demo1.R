#*********************************************************
#File Name:   Demo.R  
#
#Author:      David Noke
#
#Description: Basic R functions that get and filter data
#
#Key Words: read.table, select(), filter(), mutate(),
#           group_by(), summarize(), arrange(),
#           as.data.frame()
#*********************************************************
# Data Demo
#
# Working with data:
#   Step 1: Import data  
#   Step 2: Inspect and clean 
#   Step 3: Transform data 
#   Step 4: Export data

#Set working directory
setwd("C:/Kaggle/R Data")

#Read a tab-delimited data file
cars <- read.table(
      file = "Cars.txt",
      header = TRUE,
      sep = ",",
      quote = "\"")

#take a peek at the data
head(cars)

#load the dplyr library
library("dplyr")

#SELECT******************************
#select a subset of columns
temp <- select (
    .data = cars, 
    Transmission,
    Cylinders,
    Fuel.Economy)

head(temp)

#FILTER*****************************
#filter out a subset of rows
temp <- filter(
          .data = temp,
          Transmission == "Automatic")

head(temp)

#MUTATE******************************
#create a new column converting MPG to KPL
temp <-  mutate(
          .data = temp,
          Consumption = Fuel.Economy * 0.425)

head(temp)

#GROUP BY****************************
#group by column
#   returns a group data frame or tibble
#   descirbes the size and groups
temp <- group_by(
          .data = temp,
          Cylinders)

head(temp)

#AGGREGATE***************************
#aggregate the totals
temp <- summarize(
          .data = temp,
          Avg.Consumption = mean(Consumption))

head(temp)

#ARRANGE*****************************
#arrange in descending order
temp <- arrange(
          .data = temp,
          desc(Avg.Consumption))

head(temp)

#AS.DATA.FRAME***********************
#convert from tibble to frame
efficiency <- as.data.frame(temp)

print(efficiency)


#******************************************
#Chain all steps above into one command
#   piping (method chaining): %>%
#******************************************

efficiency <- cars %>%
      select(Fuel.Economy, Cylinders, Transmission) %>%
      filter(Transmission == "Automatic") %>%
      mutate(Consumption = Fuel.Economy * 0.425)%>%
      group_by(Cylinders) %>%
      summarize(Avg.Consumption = mean(Consumption))  %>%
      arrange(desc(Avg.Consumption)) %>%
      as.data.frame()
      
head(efficiency)

#Save data to a CSV file
write.csv(
    x = efficiency,
    file = "Fuel efficiency.csv",
    row.names = FALSE)




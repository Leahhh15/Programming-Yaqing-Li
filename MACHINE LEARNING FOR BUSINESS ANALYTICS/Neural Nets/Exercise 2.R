########################################################
## Exercise 2: Neural Nets for Prediction (Boston housing)
## Dataset: Boston (MASS)
########################################################

rm(list = ls())

#1 Load the MASS package. Use Boston data set in the package and save it as housing.df. Print str(housing.df).
library(MASS)
housing.df <- Boston
str(housing.df)

#2 Using preProcess(), scale all columns so that they can range from 0 to 1.
#  Name a dataframe with all the scaled columns as housing.1.df and run summary(housing.1.df).
scale.values <- caret::preProcess(housing.df, rangeBounds = c(0, 1), method = "range")
housing.1.df <- predict(scale.values, housing.df)
summary(housing.1.df)

#3 Partition housing.1.df into train.df (60%) and valid.df (40%). Use set.seed(1).
#  Print the dimensions of train.df and valid.df.
set.seed(1)
train.index <- sample(row.names(housing.1.df), 0.6 * dim(housing.1.df)[1])
valid.index <- setdiff(row.names(housing.1.df), train.index)

train.df <- housing.1.df[train.index, ]
valid.df <- housing.1.df[valid.index, ]

dim(train.df)
dim(valid.df)

#4 Run neuralnet() with 2 hidden layers (1st hidden layer with 3 nodes and 2nd hidden layer with 2 nodes).
#  Save the result as nn.housing. Plot nn.housing.
library(neuralnet)
nn.housing <- neuralnet(medv ~ ., data = train.df, linear.output = TRUE, hidden = c(3, 2))
plot(nn.housing)

#5 Print RMSE() to report the performance of nn.housing when the model is applied to each of train.df and valid.df.
library(caret)
str(train.df)

training.pred <- compute(nn.housing, train.df[, -14])
head(training.pred$net.result, n = 20)

nonscaled.training.pred <- training.pred$net.result *
  (max(housing.df$medv) - min(housing.df$medv)) + min(housing.df$medv)

RMSE(nonscaled.training.pred, housing.df[train.index, 14])

valid.pred <- compute(nn.housing, valid.df[, -14])

nonscaled.valid.pred <- valid.pred$net.result *
  (max(housing.df$medv) - min(housing.df$medv)) + min(housing.df$medv)

RMSE(nonscaled.valid.pred, housing.df[valid.index, 14])

#6 Create a data frame named result.df to compare actual and predicted median house values in the valid data set.
#  The 1st and 2nd columns of result.df have nonscaled actual median house values AND nonscaled predicted median house values, respectively.
#  Report the results of head(result.df) with options(digits = 3).
result.df <- data.frame(actual = housing.df[valid.index, "medv"],
                        predicted = nonscaled.valid.pred)
options(digits = 3)
head(result.df, n = 10)

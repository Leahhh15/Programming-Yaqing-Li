########################################################
## Exercise 1: Neural Nets for Classification (iris)
## Dataset: iris (built-in)
########################################################

rm(list = ls())

#1 Use iris data set in Base R and save it as iris.df. Print str(iris.df).
data(iris)
iris.df <- iris
str(iris.df)

#2 Using preProcess(), scale the four predictors so that they can range from 0 to 1.
#  Create a data frame with the four scaled predictors and the target variable (=Species).
#  Name it as iris.1.df and print summary(iris.1.df).
scale.values <- caret::preProcess(iris.df[, c(1:4)], rangeBounds = c(0, 1), method = "range")
iris.scaled <- predict(scale.values, iris.df[, c(1:4)])
iris.1.df <- data.frame(iris.scaled, Species = iris.df$Species)
summary(iris.1.df)

#3 Create three dummy variables based on the target variable.
#  Create iris.2.df by combining the four scaled predictors in iris.1.df and the three dummy target variables.
#  Print the structure of iris.2.df.
iris.df$Species_Setosa     <- 1 * (iris.df$Species == "setosa")
iris.df$Species_Versicolor <- 1 * (iris.df$Species == "versicolor")
iris.df$Species_Virginica  <- 1 * (iris.df$Species == "virginica")

iris.2.df <- cbind(iris.scaled, iris.df[, 6:8])
str(iris.2.df)

#4 Partition iris.2.df into train.df (60%) and valid.df (40%). Use set.seed(99).
#  Print the dimensions of train.df and valid.df.
set.seed(99)
train.index <- sample(row.names(iris.2.df), 0.6 * dim(iris.2.df)[1])
valid.index <- setdiff(row.names(iris.2.df), train.index)

train.df <- iris.2.df[train.index, ]
valid.df <- iris.2.df[valid.index, ]

dim(train.df)
dim(valid.df)

#5 Run neuralnet() with 1 hidden layer and 3 hidden nodes. Save the result as nn.iris. Plot nn.iris.
library(neuralnet)
nn.iris <- neuralnet(
  Species_Setosa + Species_Versicolor + Species_Virginica ~
    Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
  data = train.df, linear.output = FALSE, hidden = 3)
plot(nn.iris)

#6 Print the performance of nn.iris using confusionMatrix() by applying it to each of train.df and valid.df.
library(caret)

training.prediction <- compute(nn.iris, train.df[, -c(5:7)])
training.class <- apply(training.prediction$net.result, 1, which.max)
confusionMatrix(factor(training.class), factor(iris.2.df[train.index, ]$Species))

validation.prediction <- compute(nn.iris, valid.df[, -c(5:7)])
validation.class <- apply(validation.prediction$net.result, 1, which.max) - 1
confusionMatrix(factor(validation.class), factor(iris.2.df[valid.index, ]$Species))

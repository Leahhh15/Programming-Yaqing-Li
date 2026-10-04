## Exercise 2 (neural nets for prediction)##
rm(list = ls()) 

# Q1
library(MASS)
housing.df <- Boston
str(housing.df)

# Q2
scale.values <- caret::preProcess(housing.df, rangeBounds = c(0,1), method = "range") 
housing.1.df <- predict(scale.values, housing.df)
summary(housing.1.df)

# Q3
set.seed(1) 
train.index <- sample(row.names(housing.1.df), 0.6*dim(housing.1.df)[1]) 
valid.index <- setdiff(row.names(housing.1.df), train.index) 
train.df <- housing.1.df[train.index, ] 
valid.df <- housing.1.df[valid.index, ] 
dim(train.df) 
dim(valid.df) 

# Q4
library(neuralnet)
nn.housing <- neuralnet(medv ~ ., data = train.df, linear.output = T, hidden = c(3,2))
plot(nn.housing)

# Q5
library(caret) 
str(train.df) 

training.pred <- compute(nn.housing, train.df[,-14]) 
head(training.pred$net.result, n = 20) 
# class(training.pred) 

nonscaled.training.pred = training.pred$net.result*(max(housing.df$medv) 
                                                    -min(housing.df$medv))+min(housing.df$medv) 
#head(nonscaled.training.pred, n = 20) 
RMSE(nonscaled.training.pred, housing.df[train.index, 14]) 

valid.pred <- compute(nn.housing, valid.df[, -14]) 
# class(valid.pred) 

nonscaled.valid.pred = valid.pred$net.result*(max(housing.df$medv) 
                                              -min(housing.df$medv))+min(housing.df$medv) 
# head(nonscaled.valid.pred, n = 20) 
RMSE(nonscaled.valid.pred, housing.df[valid.index, 14]) 

# Q6
result.df <- data.frame(actual = housing.df[valid.index, "medv"], predicted = nonscaled.valid.pred) 
options(digits = 3) 
head(result.df, n = 10) 

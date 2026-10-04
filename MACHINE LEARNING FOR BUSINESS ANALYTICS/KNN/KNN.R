##########
## k-NN ## 
##########

rm(list = ls())

########################################################
## PART 1: k-NN for Classification (iris)
########################################################

data(iris)
iris.df <- iris

#dim(iris.df)
#head(iris.df, n=10) 
#str(iris.df) 
#summary(iris.df

#1 Split iris into train (60%), valid (20%), test (20%). Use set.seed(12).
#  Print dimensions of train.df, valid.df, test.df.
set.seed(12)
spl <- sample(c(1:3), size = nrow(iris.df), replace = TRUE, prob = c(0.6, 0.2, 0.2))
spl

train.df <- iris.df[spl == 1, ]
valid.df <- iris.df[spl == 2, ]
test.df  <- iris.df[spl == 3, ]

dim(train.df)
dim(valid.df)
dim(test.df)

#2 Normalize train/valid/test based on train values. Print first 3 rows of
#  train.norm.df, valid.norm.df, test.norm.df.
library(caret)
preProc <- preProcess(train.df[, 1:4], method = c("center", "scale"))

train.norm.df <- train.df
train.norm.df[, 1:4] <- predict(preProc, train.df[, 1:4])
head(train.norm.df, n = 3)

valid.norm.df <- valid.df
valid.norm.df[, 1:4] <- predict(preProc, valid.df[, 1:4])
head(valid.norm.df, n = 3)

test.norm.df <- test.df
test.norm.df[, 1:4] <- predict(preProc, test.df[, 1:4])
head(test.norm.df, n = 3)

#3 Find best k using valid data, k = 1 to 12. Display accuracy.df with overall accuracy.
library(caret)

accuracy.df <- data.frame(k = seq(1, 12, 1), accuracy = rep(0, 12))

for (i in 1:12) {
  knn.pred <- class::knn(train = train.norm.df[, 1:4],
                         test  = valid.norm.df[, 1:4],
                         cl    = train.norm.df[, 5],
                         k     = i)
  accuracy.df[i, 2] <- confusionMatrix(knn.pred, valid.norm.df[, 5])$overall[1]
}

options(digits = 2)
accuracy.df

#4 Assume k = 5. Combine test.df with predicted class as res.df. Print first 5 rows.
knn.pred5 <- class::knn(train.norm.df[, 1:4],
                        test.norm.df[, 1:4],
                        cl = train.norm.df[, 5],
                        k  = 5)
knn.pred5

res.df <- data.frame(test.df, Predicted_Class = knn.pred5)
head(res.df, 5)

#5 Report confusionMatrix() performance metrics on test data.
confusionMatrix(knn.pred5, test.norm.df[, 5])

#6 Classify new data (k = 5):
#  Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
#  7.0           2.3          4.2           2.0
#  7.3           3.3          3.5           1.9
#  5.2           2.3          4.0           1.8
#  Print predicted classes.
new.data.df <- data.frame(
  Sepal.Length = c(7.0, 7.3, 5.2),
  Sepal.Width  = c(2.3, 3.3, 2.3),
  Petal.Length = c(4.2, 3.5, 4.0),
  Petal.Width  = c(2.0, 1.9, 1.8))

new.data.norm.df <- predict(preProc, new.data.df)

nn1 <- class::knn(train = train.norm.df[, 1:4],
                  test  = new.data.norm.df,
                  cl    = train.norm.df[, 5],
                  k     = 5)
nn1

#7 Print a 3x5 matrix of row names of the 5 nearest neighbors for each new record.
nn <- FNN::knn(train = train.norm.df[, 1:4],
               test  = new.data.norm.df,
               cl    = train.norm.df[, 5],
               k     = 5)
nn

nbrs_names <- matrix(rownames(train.norm.df)[attr(nn, "nn.index")],
                     nrow = 3, ncol = 5)
colnames(nbrs_names) <- c("1st NN", "2nd NN", "3rd NN", "4th NN", "5th NN")
rownames(nbrs_names) <- c("New 1", "New 2", "New 3")
nbrs_names

########################################################
## PART 2: k-NN for Regression (auto-mpg)
########################################################

#8 Read auto-mpg.csv as auto.df. Keep only predictors + mpg. Report dimension.
auto.df <- read.csv("auto-mpg.csv", na.strings = "")

auto.df <- auto.df[, c("mpg", "cylinders", "displacement", "horsepower",
                       "weight", "acceleration", "model.year")]

#9 Remove rows with missing values using complete.cases(). Print dimension.
auto.df <- auto.df[complete.cases(auto.df), ]
dim(auto.df)

#10 Ensure all predictors are numeric or integer. Print str(auto.df).
str(auto.df)

#11 Split auto.df into train (60%), valid (20%), test (20%). Use set.seed(70).
#  Print dimensions of train.t.df, valid.t.df, test.t.df.
set.seed(70)
spl.t <- sample(c(1:3), size = nrow(auto.df), replace = TRUE, prob = c(0.6, 0.2, 0.2))
spl.t

train.t.df <- auto.df[spl.t == 1, ]
valid.t.df <- auto.df[spl.t == 2, ]
test.t.df  <- auto.df[spl.t == 3, ]

dim(train.t.df)
dim(valid.t.df)
dim(test.t.df)

#12 Normalize train/valid/test based on train values. Print first 3 rows of
#  train.t.norm.df, valid.t.norm.df, test.t.norm.df.
preProc.t <- preProcess(train.t.df[, -1], method = c("center", "scale"))

train.t.norm.df <- train.t.df
train.t.norm.df[, -1] <- predict(preProc.t, train.t.df[, -1])
head(train.t.norm.df, n = 3)

valid.t.norm.df <- valid.t.df
valid.t.norm.df[, -1] <- predict(preProc.t, valid.t.df[, -1])
head(valid.t.norm.df, n = 3)

test.t.norm.df <- test.t.df
test.t.norm.df[, -1] <- predict(preProc.t, test.t.df[, -1])
head(test.t.norm.df, n = 3)

#13 Find best k using valid data, k = 1 to 20. Display rmse.df with RMSE values.
rmse.df <- data.frame(k = seq(1, 20, 1), rmse = rep(0, 20))

library(FNN)
for (i in 1:20) {
  knn.pred <- knn.reg(train = train.t.norm.df[, -1],
                      test  = valid.t.norm.df[, -1],
                      y     = train.t.norm.df$mpg,
                      k     = i)
  rmse.df[i, 2] <- sqrt(mean((valid.t.df$mpg - knn.pred$pred)^2))
}

options(digits = 3)
rmse.df

#14 Pick a k value and explain why.
# k = 10 gives the lowest validation RMSE (2.50).
# However, for the following questions we follow the assignment's assumption of k = 4.

#15 Assume k = 4. Predict mpg in test.t.df. Combine with test.t.df as res.t.df.
#  Print first 5 rows.
knn.pred4 <- knn.reg(train = train.t.norm.df[, -1],
                     test  = test.t.norm.df[, -1],
                     y     = train.t.df$mpg,
                     k     = 4)
res.t.df <- data.frame(test.t.df, PredictedMPG = knn.pred4$pred)
head(res.t.df, n = 5)

#16 Print RMSE when kNN predicts mpg on test data with k = 4.
library(caret)
RMSE(knn.pred4$pred, test.t.df$mpg)

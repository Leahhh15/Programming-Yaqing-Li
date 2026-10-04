####################################
## Decision Trees (eBay Auctions) ##
## Dataset: eBayAuctions.csv      ##
####################################

rm(list = ls())

#1 Read eBayAuctions.csv as ebay.df. Empty cells should be NA. Report dimension.
ebay.df <- read.csv("eBayAuctions.csv", na.strings = "")
dim(ebay.df)

#2 Convert Duration and Competitive to factor. Report their data types.
ebay.df$Duration <- factor(ebay.df$Duration)
ebay.df$Competitive <- factor(ebay.df$Competitive)
str(ebay.df[c("Duration", "Competitive")])

#3 Split into train (60%) and valid (40%). Use set.seed(1).
#  Report dimensions of train.df and valid.df.
set.seed(1)
train.index <- sample(c(1:dim(ebay.df)[1]), dim(ebay.df)[1] * 0.6)
train.df <- ebay.df[train.index, ]
dim(train.df)

valid.df <- ebay.df[-train.index, ]
dim(valid.df)

#4 Fit a classification tree using all predictors (default rpart()).
#  Plot the tree using prp() with lab-session default options.
library(rpart)
library(rpart.plot)
library(caret)

default.ct <- rpart(Competitive ~ ., data = train.df, method = "class")
print(default.ct)

prp(default.ct, type = 1, extra = 1, under = TRUE, split.font = 2, varlen = -10)

#5 For the tree in Q4, show confusionMatrix() on train and valid.
#  Set positive class to "1" (competitive).
default.ct.point.pred.train <- predict(default.ct, train.df, type = "class")
head(default.ct.point.pred.train, n = 20)
class(default.ct.point.pred.train)

confusionMatrix(default.ct.point.pred.train, train.df$Competitive, positive = "1")

default.ct.point.pred.valid <- predict(default.ct, valid.df, type = "class")
head(default.ct.point.pred.valid, n = 20)
class(default.ct.point.pred.valid)

confusionMatrix(default.ct.point.pred.valid, valid.df$Competitive, positive = "1")

#6 Smaller tree: min number of records in terminal node = 20, max depth = 4.
#  Fit the tree and plot with lab-session default options.
deeper.ct <- rpart(Competitive ~ ., data = train.df, method = "class",
                   control = rpart.control(minbucket = 20, maxdepth = 4))
prp(deeper.ct, type = 1, extra = 1, under = TRUE, split.font = 2, varlen = -10)

#7 For the tree in Q6, show confusionMatrix() on train and valid.
#  Set positive class to "1".
deeper.ct.point.pred.train <- predict(deeper.ct, train.df, type = "class")
confusionMatrix(deeper.ct.point.pred.train, train.df$Competitive, positive = "1")

deeper.ct.point.pred.valid <- predict(deeper.ct, valid.df, type = "class")
confusionMatrix(deeper.ct.point.pred.valid, valid.df$Competitive, positive = "1")

#8 Display the rules from the tree in Q6 using rpart.rules().
rpart.rules(deeper.ct)

#9 Run a random forest (n = 500) on train data. Report confusionMatrix() on valid data.
library(randomForest)
rf <- randomForest(Competitive ~ ., data = train.df, ntree = 500, importance = TRUE)
rf.pred <- predict(rf, valid.df)
confusionMatrix(rf.pred, valid.df$Competitive)

#10 Plot variable importance based on percentage increase in accuracy.
varImpPlot(rf)

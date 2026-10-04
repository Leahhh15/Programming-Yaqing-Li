##Decision Tree R Lab: Exercise 1##

rm(list = ls())

# 0
titanic.df <- read.csv("titanic.csv", na.strings = "")
str(titanic.df)
titanic.df <- titanic.df[, -c(1, 4, 9, 11)]

dim(titanic.df)
str(titanic.df)

titanic.df$Survived <- factor(titanic.df$Survived)
titanic.df$Sex <- factor(titanic.df$Sex)
titanic.df$Embarked <- factor(titanic.df$Embarked)

str(titanic.df)

# 1
set.seed(99)

train.index <- sample(c(1:dim(titanic.df)[1]), dim(titanic.df)[1]*0.7) 
train.df <- titanic.df[train.index, ] 
dim(train.df) 

valid.df <- titanic.df[-train.index, ] 
dim(valid.df)

# 2
library(rpart) 
library(rpart.plot)

default.ct <- rpart(Survived ~ ., data = train.df, method = "class") 
print(default.ct)

rpart.rules(default.ct) 
rpart.rules(default.ct, extra = 4) 

# 3
length(default.ct$frame$var[default.ct$frame$var == "<leaf>"]) 

# 4
prp(default.ct) 
prp(default.ct, type = 1, extra = 1, under = TRUE, split.font = 2, varlen = -10) 

# 5
new.df <- data.frame(Pclass = 1 , Sex = "male", 
                     Age = 40, SibSp = 1, Parch = 0, 
                     Fare = 8.2, Embarked = "C")
new.df
str(new.df)

new.df$Sex <- factor(new.df$Sex)
new.df$Embarked <- factor(new.df$Embarked)

predict(default.ct, new.df) 
predict(default.ct, new.df, type = "class") 

# 6
library(caret)

default.ct.point.pred.train <- predict(default.ct, train.df, type = "class") 
head(default.ct.point.pred.train, n=20) 
class(default.ct.point.pred.train) 

confusionMatrix(default.ct.point.pred.train, train.df$Survived, positive = "1") 

default.ct.point.pred.valid <- predict(default.ct, valid.df, type = "class") 
head(default.ct.point.pred.valid, n=20) 
class(default.ct.point.pred.valid) 

confusionMatrix(default.ct.point.pred.valid, valid.df$Survived, positive = "1") 

# 7
deeper.ct <- rpart(Survived ~ ., data = train.df, method = "class", cp = 0, maxdepth = 3) 

prp(deeper.ct, type = 1, extra = 1, under = TRUE, split.font = 1, varlen = -10, 
    box.col=ifelse(deeper.ct$frame$var == "<leaf>", 'gray', 'white')) 

rpart.rules(deeper.ct) 
rpart.rules(deeper.ct, extra = 4) 

length(deeper.ct$frame$var[deeper.ct$frame$var == "<leaf>"])

prp(deeper.ct) 
prp(deeper.ct, type = 1, extra = 1, under = TRUE, split.font = 2, varlen = -10) 

# 8
library(randomForest) 

rf <- randomForest(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, data = train.df, ntree = 500, importance = TRUE) 

rf.pred <- predict(rf, valid.df) 
head(rf.pred, n=30) 
confusionMatrix(rf.pred, valid.df$Survived)

# 9
varImpPlot(rf) 
varImpPlot(rf, type = 1) 
varImpPlot(rf, type = 2) 

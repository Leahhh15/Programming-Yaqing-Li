##Decision Tree R Lab: In-class Exercise 2##

rm(list = ls())

# 1
library(rpart)

data(car90)

car <- car90[, c("Price", "Disp", "HP", "Height", "Length", "Tank", "Type")]

# 2
car <- na.omit(car)
str(car)

# 3
set.seed(99) 
train.index <- sample(c(1:dim(car)[1]), dim(car)[1]*0.6) 

train.df <- car[train.index, ] 
dim(train.df) 

valid.df <- car[-train.index, ] 
dim(valid.df)

# 4
library(rpart)
library(rpart.plot)

default.rt <- rpart(Price ~ Disp + HP + Height + Length + Tank + Type, data = train.df) 
print(default.rt)

# 5
prp(default.rt) 

# 6
new.df <- data.frame(Disp = 140, HP = 130, Height = 50, 
                     Length = 200, Tank = 18, Type = "Large")
str(new.df)

new.df$Type <- factor(new.df$Type)

predict(default.rt, new.df) 

# 7
pred.train <- predict(default.rt, train.df) 
head(pred.train, n = 10) 

pred.valid <- predict(default.rt, valid.df) 
head(pred.valid, n = 10) 

library(Metrics) 
rmse(actual = train.df$Price, predicted = pred.train) 
rmse(actual = valid.df$Price, predicted = pred.valid) 

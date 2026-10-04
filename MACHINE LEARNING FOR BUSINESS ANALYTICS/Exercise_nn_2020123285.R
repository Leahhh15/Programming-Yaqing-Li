##Exercise 1 (neural nets for classification)##
rm(list = ls()) 

# Q1
data(iris)
iris.df <- iris
str(iris.df)

# Q2
scale.values <- caret::preProcess(iris.df[,c(1:4)], rangeBounds = c(0,1), method = "range") 
iris.scaled = predict(scale.values,iris.df[,c(1:4)]) 
iris.1.df <- data.frame(iris.scaled, Species = iris.df$Species)
summary(iris.1.df)

# Q3
iris.df$Species_Setosa <- 1* (iris.df$Species == "setosa")
iris.df$Species_Versicolor <- 1* (iris.df$Species == "versicolor")
iris.df$Species_Virginica <- 1* (iris.df$Species == "virginica")

iris.2.df <- cbind(iris.scaled, iris.df[, 6:8])
str(iris.2.df)

# Q4
set.seed(99)
train.index <- sample(row.names(iris.2.df), 0.6*dim(iris.2.df)[1]) 
valid.index <- setdiff(row.names(iris.2.df), train.index) 
train.df <- iris.2.df[train.index, ] 
valid.df <- iris.2.df[valid.index, ] 
dim(train.df) 
dim(valid.df) 

# Q5
library(neuralnet) 
nn.iris <- neuralnet(Species_Setosa + Species_Versicolor + Species_Virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = train.df, linear.output = F, hidden = 3)
plot(nn.iris)

# Q6
library(caret)
training.prediction <- compute(nn.iris, train.df[,-c(5:7)]) 
training.class <- apply(training.prediction$net.result,1,which.max)
confusionMatrix(factor(training.class), factor(iris.2.df[train.index,]$Species))


validation.prediction <- compute(nn.iris, valid.df[,-c(5:7)]) 
validation.class <-apply(validation.prediction$net.result,1,which.max)-1 
confusionMatrix(factor(validation.class), factor(iris.2.df[valid.index,]$Species)) 


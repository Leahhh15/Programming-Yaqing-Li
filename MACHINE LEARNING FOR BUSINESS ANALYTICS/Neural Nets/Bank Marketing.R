########################################################
## Neural Nets (Bank Marketing)
## Dataset: bank_marketing_new.csv
########################################################

rm(list = ls())

#1 Read bank_marketing_new.csv as bank.df, keep only y, age, balance, campaign, previous, education.
#  stringsAsFactors = TRUE. Report dim() and str().
bank.df <- read.csv("bank_marketing_new.csv", na.strings = "", stringsAsFactors = TRUE)
bank.df <- bank.df[, c("y", "age", "balance", "campaign", "previous", "education")]
dim(bank.df)
str(bank.df)

#2 Scale age, balance, campaign, previous to [0, 1] using min() and max().
#  Report summary().
bank.df$age      <- (bank.df$age      - min(bank.df$age))      / (max(bank.df$age)      - min(bank.df$age))
bank.df$balance  <- (bank.df$balance  - min(bank.df$balance))  / (max(bank.df$balance)  - min(bank.df$balance))
bank.df$campaign <- (bank.df$campaign - min(bank.df$campaign)) / (max(bank.df$campaign) - min(bank.df$campaign))
bank.df$previous <- (bank.df$previous - min(bank.df$previous)) / (max(bank.df$previous) - min(bank.df$previous))
summary(bank.df)

#3 Create dummy variables for education and y using class.ind().
#  Name dummies: edu_1 (primary), edu_2 (secondary), edu_3 (tertiary), edu_9 (unknown),
#                term_d_no (no), term_d_yes (yes).
#  Report column names of bank.df1.
library(nnet)
bank.df <- cbind(bank.df,
                 class.ind(as.factor(bank.df$education)),
                 class.ind(as.factor(bank.df$y)))
str(bank.df)

bank.df1 <- bank.df
colnames(bank.df1)[7:12] <- c("edu_1", "edu_2", "edu_3", "edu_9", "term_d_no", "term_d_yes")
colnames(bank.df1)

#4 Create bank.df2 by selecting:
#  age, balance, campaign, previous, edu_1, edu_2, edu_3, edu_9, term_d_no, term_d_yes.
#  Report column names of bank.df2.
bank.df2 <- bank.df1[, c("age", "balance", "campaign", "previous",
                         "edu_1", "edu_2", "edu_3", "edu_9",
                         "term_d_no", "term_d_yes")]
colnames(bank.df2)

#5 Partition into train (60%) and valid (40%). Use set.seed(199).
#  Report dimensions of train.df and valid.df.
set.seed(199)
train.index <- sample(row.names(bank.df2), 0.6 * dim(bank.df2)[1])
valid.index <- setdiff(row.names(bank.df2), train.index)

train.df <- bank.df2[train.index, ]
valid.df <- bank.df2[valid.index, ]

dim(train.df)
dim(valid.df)

#6 Run a neural net on train data (do NOT use edu_9 as predictor).
#  Use 1 hidden layer with 4 nodes. Add stepmax = 1e+06 if needed.
#  Report confusionMatrix() on (a) train and (b) valid.
library(neuralnet)
library(caret)

nn.bank <- neuralnet(
  term_d_no + term_d_yes ~ age + balance + campaign + previous + edu_1 + edu_2 + edu_3,
  data = train.df, linear.output = FALSE, hidden = 4, stepmax = 1e+06)
# plot(nn.bank)

bank.df1$y <- ifelse(bank.df1$y == "no", 1, 2)

# (a) train
training.prediction <- compute(nn.bank, train.df[, c(1:7)])
training.class <- apply(training.prediction$net.result, 1, which.max)
confusionMatrix(factor(training.class), factor(bank.df1[train.index, ]$y))

# (b) valid
validation.prediction <- compute(nn.bank, valid.df[, c(1:7)])
validation.class <- apply(validation.prediction$net.result, 1, which.max)
confusionMatrix(factor(validation.class), factor(bank.df1[valid.index, ]$y))

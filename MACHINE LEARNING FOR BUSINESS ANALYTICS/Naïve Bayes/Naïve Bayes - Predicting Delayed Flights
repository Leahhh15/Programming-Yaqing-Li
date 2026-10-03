###############################
## Naïve Bayes               ##
## Dataset: FlightDelays.csv ##
###############################

#0 Read "FlightDelays.csv" file as delays_ex.df.
delays_ex.df <- read.csv("FlightDelays.csv", na.strings = "")

#1 Report how many rows and columns exist in delays_ex.df.
dim(delays_ex.df)

#2 Report the first 10 rows of delays_ex.df.
head(delays_ex.df, 10)

#3 Report the brief summary of attributes in delays_ex.df.
str(delays_ex.df)

#4 Report the number of missing values in each column of delays_ex.df.
colSums(is.na(delays_ex.df))

#5 Create an attribute named PR_Month (=Period of the Month) and add it to delays_ex.df. To do so, take only dates from FL_DATE, and convert them to the period of the month (early, mid, or late) based on the following: early = 1-10; mid = 11-20; late = 21-31.
# Hint: Use a nested if else statement: ifelse( , , ifelse( , , ))
library(lubridate)
delays_ex.df$FL_DATE2 <- mdy(delays_ex.df$FL_DATE)
str(delays_ex.df)
delays_ex.df$day <- day(delays_ex.df$FL_DATE2)
head(delays_ex.df)
delays_ex.df$PR_Month <- ifelse(delays_ex.df$day < 11, "early",
                                ifelse(delays_ex.df$day < 21, "mid", "late"))

#6 Convert PR_Month to the factor data type and report the summary statistics (i.e., # of records for each level).
delays_ex.df$PR_Month <- factor(delays_ex.df$PR_Month)
levels(delays_ex.df$PR_Month)
summary(delays_ex.df$PR_Month)

#7 Create bins for CRS_DEP_TIME as follows:
# 600 < CRS_DEP_TIME < 700 -> 6
# 700 < CRS_DEP_TIME < 800 -> 7
# 800 < CRS_DEP_TIME < 900 -> 8
# 900 < CRS_DEP_TIME < 1000 -> 9
# ...
# 2000 < CRS_DEP_TIME < 2100 -> 20
# 2100 < CRS_DEP_TIME < 2200 -> 21
# Using the bins, add a new variable ("CRS_DEP_TIME_BIN") to the data frame. Report the summary statistics (i.e., # of records for each level).
delays_ex.df$CRS_DEP_TIME_BIN <- factor(floor(delays_ex.df$CRS_DEP_TIME / 100))
levels(delays_ex.df$CRS_DEP_TIME_BIN)
summary(delays_ex.df$CRS_DEP_TIME_BIN)

#8 You will use DAY_WEEK, CRS_DEP_TIME_BIN, ORIGIN, Weather, and PR_Month as predictors. Change the data type of variables (predictors and outcome), if necessary.
delays_ex.df$DAY_WEEK <- factor(delays_ex.df$DAY_WEEK)
delays_ex.df$CRS_DEP_TIME_BIN <- factor(delays_ex.df$CRS_DEP_TIME_BIN)
delays_ex.df$ORIGIN <- factor(delays_ex.df$ORIGIN)
delays_ex.df$Weather <- factor(delays_ex.df$Weather)
delays_ex.df$Flight.Status <- factor(delays_ex.df$Flight.Status)

#9 Report columns with brief summary for delays_ex.df.
str(delays_ex.df)

#10 Create a vector named "selected_var" with the outcome and predictor variables.
selected.var <- c("DAY_WEEK", "CRS_DEP_TIME_BIN", "ORIGIN", "Weather", "PR_Month", "Flight.Status")

#11 Partition the data into training (70%) and validation (30%). Use set.seed(2). After partitioning the data, report the results of dim() and head() for train.df and valid.df.
set.seed(2)
train.index <- sample(1:dim(delays_ex.df)[1], dim(delays_ex.df)[1] * 0.7)
train.df <- delays_ex.df[train.index, selected.var]
dim(train.df)
head(train.df)

valid.df <- delays_ex.df[-train.index, selected.var]
dim(valid.df)
head(valid.df)

#12 Run naive Bayes on the training data.
library(e1071)
delays_ex.nb <- naiveBayes(Flight.Status ~ ., data = train.df)
delays_ex.nb

#13 Print a data frame with four columns: (1) actual class, (2) predicted probability for "delayed", (3) predicted probability for "ontime", and (4) predicted class for the first 10 records in the valid data.
pred.prob <- predict(delays_ex.nb, newdata = valid.df, type = "raw")
pred.class <- predict(delays_ex.nb, newdata = valid.df)
df <- data.frame(actual = valid.df$Flight.Status, predicted = pred.class, pred.prob)
head(df, n = 10)

#14 Report (1) actual class, (2) predicted probability for "delayed", (3) predicted probability for "ontime", and (4) predicted class of the record(s) in the valid data with DAY_WEEK = 1, CRS_DEP_TIME_BIN = 8, ORIGIN = "DCA", Weather = 0, PR_Month = "early".
df[valid.df$DAY_WEEK == 1 &
     valid.df$CRS_DEP_TIME_BIN == 8 &
     valid.df$ORIGIN == "DCA" &
     valid.df$Weather == 0 &
     valid.df$PR_Month == "early", ]

#15 Create a data frame named "new.df" with the following records:
# DAY_WEEK  CRS_DEP_TIME_BIN  ORIGIN  Weather  PR_Month
# 1         3                 DCA     0        early
# 5         5                 IAD     1        late
# Print new.df.
new.df <- data.frame(DAY_WEEK = c(1, 5),
                     CRS_DEP_TIME_BIN = c(3, 5),
                     ORIGIN = c("DCA", "IAD"),
                     Weather = c(0, 1),
                     PR_Month = c("early", "late"))
print(new.df)

#16 Report (1) predicted probability for "delayed", (2) predicted probability for "ontime", and (3) predicted class of the records in new.df.
str(new.df)
new.df$DAY_WEEK <- factor(new.df$DAY_WEEK)
new.df$CRS_DEP_TIME_BIN <- factor(new.df$CRS_DEP_TIME_BIN)
new.df$ORIGIN <- factor(new.df$ORIGIN)
new.df$Weather <- factor(new.df$Weather)
new.df$PR_Month <- factor(new.df$PR_Month)

str(new.df)
pred.prob.new <- predict(delays_ex.nb, newdata = new.df, type = "raw")
pred.prob.new

pred.class.new <- predict(delays_ex.nb, newdata = new.df)
pred.class.new

#17 Print ROC curve and report AUC.
library(pROC)
ROC_flight <- roc((ifelse(valid.df$Flight.Status == "delayed", 1, 0)), pred.prob[, 1])
plot(ROC_flight, col = "blue")
auc(ROC_flight)

#18 Plot lift chart.
library(gains)
gain <- gains(ifelse(valid.df$Flight.Status == "delayed", 1, 0), pred.prob[, 1], groups = 10)
gain

plot(c(0, gain$cume.pct.of.total * sum(valid.df$Flight.Status == "delayed")) ~ c(0, gain$cume.obs),
     xlab = "# cases", ylab = "Cumulative", main = "Lift Chart", type = "l")
lines(c(0, sum(valid.df$Flight.Status == "delayed")) ~ c(0, dim(valid.df)[1]), lty = 2)

#19 Report confusion matrix and accuracy using each of train data.
library(caret)
pred.class <- predict(delays_ex.nb, newdata = train.df)
confusionMatrix(pred.class, train.df$Flight.Status)

#20 Report confusion matrix and accuracy using each of valid data.
pred.class <- predict(delays_ex.nb, newdata = valid.df)
confusionMatrix(pred.class, valid.df$Flight.Status)

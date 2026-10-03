###############################
## Part A: R Basics (Q1-Q11) ## 
###############################

# Q1 Assign the data 2.79, 5.83, 12.3, 3.2, 8.35, 3.4, 0.74 to a vector named x1. Print x1.
x1 <- c(2.79, 5.83, 12.3, 3.2, 8.35, 3.4, 0.74)
print(x1)

# Q2 Report the average of the maximum and minimum elements in x1.
mean(c(max(x1), min(x1)))

# Q3 Create a vector named x2 with four elements: maximum, minimum, and average of the numbers in x1; and the 3rd element of x1. Print x2.
x2 <- c(max(x1), min(x1), mean(x1), x1[3])
print(x2)

# Q4 Assign the data "Samsung", "Hyundai", "LG" to a vector named str1. Print str1.
str1 <- c("Samsung", "Hyundai", "LG")
print(str1)

# Q5 Create a vector named str2 by adding "SK" to str1. Use paste() to create a vector named str3 that combines strings in str2. Print str3 that has one string of "Samsung & Hyundai & LG & SK".
str2 <- paste(str1, "SK", sep = " & ")
str3 <- paste(str2, collapse = " & ")
print(str3)

# Q6 Print vectors with the following sequences. Name the vector as z1 for a, z2 for b, and z3 for c.
# a. 3 1 5 3 1 5 3 1 5 3 1 5
# b. 2 6 10 14 18 22 26 30
# c. 7 7 7 7 3 3 3 9 9 9 9 9
z1 <- rep(c(3, 1, 5), 4)
z2 <- seq(from = 2, to = 30, by = 4)
z3 <- rep(c(7, 3, 9), times = c(4, 3, 5))
print(z1)
print(z2)
print(z3)

# Q7 Create a vector named d1 with three elements: the first day (Jan 1) and last day (Dec 31) of the current year, and today's date. Using d1, compute (1) the number of days from the first day of the current year to today's date, and (2) the number of days from today's date to the last day of the current year. Report the results.
today_date <- Sys.Date()
first_day <- as.Date("2023-01-01")
last_day <- as.Date("2023-12-31")
d1 <- c(first_day, last_day, today_date)
day_1 <- d1[3] - d1[1]
day_2 <- d1[2] - d1[3]
print(day_1)
print(day_2)

# Q8 Using set.seed(101), generate 40 uniform random numbers that lie in the interval [0, 100] and name the vector as scores. Round off the data in the vector to nearest integer, and assign to scores_r.
set.seed(101)
scores <- runif(40, min = 0, max = 100)
scores_r <- round(scores)

# Q9 Create a matrix with 5 columns based on scores_r, name it as scores_m.
scores_m <- matrix(scores_r, ncol = 5)

# Q10 Report a mean for each of the columns in scores_m.
colMeans(scores_m)

# Q11 Report a minimum value for each of the rows in scores_m.
apply(scores_m, 1, min)

#######################################
## Part B: Titanic Dataset (Q12-Q17) ##
## Dataset: titanic_hw_new.csv       ##
#######################################

# Q12 Download a csv file named "titanic_hw_new.csv" and read the file as titanic.df. When you read the file, make sure that empty cells read as missing values. Report how many rows and columns are in titanic.df.
titanic.df <- read.csv("titanic_hw_new.csv", stringsAsFactors = TRUE, na.strings = "")
nrow(titanic.df)
ncol(titanic.df)

# Q13 Using titanic.df, create a data frame named titanic1.df only with PassengerId, Survived, Pclass, Sex, Age, and SibSp columns. Report how many rows and columns are in titanic1.df.
titanic1.df <- titanic.df[, c("PassengerId", "Survived", "Pclass", "Sex", "Age", "SibSp")]
nrow(titanic1.df)
ncol(titanic1.df)

# Q14 Report columns with brief summary for titanic1.df.
summary(titanic1.df)

# Q15 Report the number of missing values for each of the columns in titanic1.df.
colSums(is.na(titanic1.df))

# Q16 Impute the missing value(s) in the Age column with the mean value (rounded to nearest integer) of the column. Report the first six rows of titanic1.df.
mean_age <- round(mean(titanic1.df$Age, na.rm = TRUE))
titanic1.df$Age[is.na(titanic1.df$Age)] <- mean_age
head(titanic1.df)

# Q17 Create a data frame named titanic2.df after removing records with missing values in titanic1.df. Report how many rows and columns are in titanic2.df.
titanic2.df <- na.omit(titanic1.df)
nrow(titanic2.df)
ncol(titanic2.df)

######################################
## Part C: mtcars Dataset (Q18-Q20) ##
## Dataset: mtcars (built-in)       ##
######################################

# Q18 Report how many rows and columns exist in an R built-in dataset named mtcars, and the first six rows of mtcars.
nrow(mtcars)
ncol(mtcars)
head(mtcars)

# Q19 Convert the data type of a column named cyl in mtcars into factor and report columns with brief summary for mtcars.
mtcars$cyl <- as.factor(mtcars$cyl)
summary(mtcars)

# Q20 Add a column named fuel_efficiency by comparing elements in the mpg column with the mean of the elements. If an element is larger than (or equal to) the mean, add "bad"; otherwise add "good" in the column. Report the first 6 rows of mtcars.
mtcars$fuel_efficiency <- ifelse(mtcars$mpg >= mean(mtcars$mpg), "bad", "good")
head(mtcars)

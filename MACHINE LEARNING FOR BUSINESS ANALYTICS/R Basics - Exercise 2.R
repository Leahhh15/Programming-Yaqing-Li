##############
##Exercise 2##
##############

#1 Create a 5x4 matrix named x with 20 uniform random numbers in [0, 100]; use set.seed(99); print x.
set.seed(99)
x <- matrix(runif(20, 0, 100), nrow = 5, ncol = 4)
print(x)

#2 Round the sum of each row and each column; report the results.
row_sums <- round(rowSums(x))
col_sums <- round(colSums(x))
row_sums
col_sums

#3 Create a data frame named my_product using the given data; convert strings to factors; print my_product.
my_product <- data.frame(
  Product = factor(c("Cereal", "Milk", "Rice", "Cookie")),
  Price   = factor(c(15, 20, 30, 50)),
  Stock   = factor(c(2000, 1000, 1500, 500)),
  Code    = factor(c("1a", "1b", "2c", "3a")))
print(my_product)

#4 Report the structure of the data frame.
str(my_product)

#5 After changing column names to "Product", "Units_sold", "Price", and "Location", report the column names.
colnames(my_product) <- c("Product", "Units_sold", "Price", "Location")
colnames(my_product)

#6 After changing row names to "P1", "P2", "P3", and "P4", report the row names.
rownames(my_product) <- c("P1", "P2", "P3", "P4")
rownames(my_product)

#7 Report the summary of descriptive statistics for the data frame.
summary(my_product)

#8 Report an element in row 4 and column 1.
my_product[4, 1]

#9 Report elements in column names = "Product" and "Units_sold".
my_product[, c("Product", "Units_sold")]

#10 Save a dataset named "iris" (built-in dataset) as iris_new. Report the data structure and the first 10 rows.
iris_new <- iris
str(iris_new)
head(iris_new, 10)

#11 Report the number of missing values in each column of iris_new.
colSums(is.na(iris_new))

#12 Change an element in row 3 and column 1 to NA, using the following: iris_new[3,1] <- NA.
iris_new[3, 1] <- NA

#13 Report the first 6 rows and the number of missing values in Sepal.Length column of iris_new.
head(iris_new, 6)
sum(is.na(iris_new$Sepal.Length))

#14 Impute the missing value in row 3 and column 1 of iris_new. To do so, replace the missing value by the mean of the remaining values in the corresponding column. Report an element in row 3 and column 1.
iris_new[3, 1] <- mean(iris_new[, "Sepal.Length"], na.rm = TRUE)
iris_new[3, 1]

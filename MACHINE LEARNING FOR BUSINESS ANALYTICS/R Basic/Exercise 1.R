##############
##Exercise 1##
##############

#1 Generate 10 uniform random numbers in [-10, 10] using set.seed(100); print x.
set.seed(100)
x <- runif(10, min = -10, max = 10)
print(x)

#2 Sort x in descending order and round to nearest integers.
x <- sort(x, decreasing = TRUE)
round(x)

#3 Round down the numbers in x to nearest integers.
floor(x)

#4 Round up the numbers in x to nearest integers.
ceiling(x)

#5 Convert the numbers in x to integers toward 0.
trunc(x)

#6 Create x1 with the maximum, minimum, and average of x; print x1.
max_x <- max(x)
min_x <- min(x)
avg_x <- mean(x)
x1 <- c(max_x, min_x, avg_x)
print(x1)

#7 Find which element in x is the maximum and which is the minimum.
which.max(x)
which.min(x)

#8 (a) Print the first five elements in x.
print(x[1:5])

#8 (b) Print the second and eighth elements in x.
print(x[c(2, 8)])

#8 (c) Add the second and eighth elements.
x[2] + x[8]

#9 Create y with 3 strings: "apple", "orange", "strawberry".
y <- c("apple", "orange", "strawberry")

#10 Create z by adding "peach" to y; print z.
z <- c(y, "peach")
print(z)

#11 Collapse z into a single string separated by "; "; print z1.
z1 <- paste(z, collapse = "; ")
print(z1)

#12 (a) Repeat c(2, 5) 10 times.
a <- rep(c(2, 5), times = 10)
a

#12 (b) Repeat seq(1, 10, by = 3) 2 times.
b <- rep(seq(1, 10, by = 3), times = 2)
b

#12 (c) Create a vector with seven 3s followed by four 7s.
c <- c(rep(3, 7), rep(7, 4))
c

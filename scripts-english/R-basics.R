# Basic data types ----
## Numeric ----
x = 5
y <- 5
x = 2.55

## Text ----
z = 'my_text'
z1 = "my_text"
x = "5"

## Logical ----
z1 = TRUE # 1
z2 = FALSE # 0

## Factor ----
w = factor('abc')

# Math operations ----
x = 5
y = 10

x + y
x - y
x * y
x / y
x ^ y  # alternatively **
x %% 2
4 %% 2

# Vectors ----
x = 5
x = c(5)

x = c(3, 5, 7)
y = c('a', 'b', 'c')
z = c(TRUE, TRUE, FALSE)

w = c(123, 'text') # vector can have only single data type inside it
f = c('a', 'b', 'a')
f = as.factor(f)

options(scipen = 99) # turn off scientific notation of big/small figures
5000000000
0.00000005

# Vector operations ----
x = c(1,4,6)
y = c(5,7,9)

x + y
x + 3

z1 = c(2,3)
x + z1

z2 = c(2,3,5,9)
z1 + z2

x = c('a', 'b', 'c')
y = c('x', 'y', 'x')
x + y

paste(c('abc', 'my_text'))

# Logical operations ----
x = 5
y = 3

x > y
x >= y
x < y
x <= y
x == y

x != y
!(x == y)

'abc' < 'add'

# & - and operator - all have to be true
(2 > 1) & (5 > 2)
(2 > 1) & (5 < 2)

# | - or operator - at least one have to be true
(2 > 1) | (5 > 2)
(2 > 1) | (5 < 2)

x = c(1,4,6)
y = c(5,7,9)
x > y

# Subsetting vectors ----
2:6

x = c(1,4,6,7,9,10,90)
x[3]

x[c(2,5)]
x[2:6]
x[length(x)]

# take only even number
x %% 2 # step 1
x %% 2 == 0 # step 2
x[x %% 2 == 0] # step 3

# Some basic in-built function ----
length(x)
sum(x)
mean(x)
sqrt(x)
round(sqrt(x), 3)
round(digits = 3, x = sqrt(x))
round(916, digits = -1)
abs(-500)
median(x)

x = 1:100
x = seq(1, 100, by = 0.5)
x = seq(1, 100, length.out = 15)

y = rep(5, 10)

rep(c(1,2), times = 10)
rep(c(1,2), each = 10)

# c(), seq(), rep()
rep(seq(0, 3, by = 0.25), time = 3)

my_text = 'some example text'
toupper(my_text)
tolower('ABCDEF')
length(my_text)
nchar(my_text)

my_text = c('abc', 'def')

# we provide 2-element vector to create 1-element of them
paste(my_text, collapse = '---')

# we provide 2 single-element vectors to create 1-element of them
paste('abc', 'def', sep = '---')

# Data frames ----
df = data.frame(
  id = c(1,2,3)
  , name = c('John', 'James', 'Andrew')
  , age = c(20, 30, 28)
)

df2 = data.frame(
  id = c(1,2,3)
  , name = c('John', 'James', 'Andrew')
  , age = 22
)

df3 = data.frame(
  id = c(1,2,3)
  , name = c('John', 'James', 'Andrew')
  , age = c(22, 23)
)

df[2:3, 2]
df[, 2] # rows, column
df[2, ]

df$name = 'test'
df$new_columns = 'test'

# Concatenate data.frames
df4 = rbind(df, df2)
df5 = cbind(df, df2)

View(df)

# Lists ----
my_list1 = list(
  id = c(1,2,3)
  , name = c('John', 'James', 'Andrew')
  , age = c(20, 30, 28)
)

my_list2 = list(
  id = c(1,2,3)
  , name = c('John', 'James', 'Andrew')
  , age = seq(0, 100, by = 0.15)
)

my_list3 = list(df, df2, my_list1, my_text)

# Data type conversion ----
x = c('123', '245', 'text')
class(x)

y = as.numeric(x)
z = as.character(y)

as.factor()
my_date = as.Date('23/03/2024', format = '%d/%m/%Y')

as.data.frame(my_list1)
as.data.frame(my_list2)

as.list(df)
as.list(df2)

# Loops ----
for (n in 1:100) {
  print(n)
}

fruits = c('apple', 'banana', 'grape')

for (x in fruits) {
  y = toupper(x)
  print(y)
}

for (i in 1:nrow(df)) {
  for (j in 1:ncol(df)) {
    print(df[i, j])
  }
}

i = 1
while(i < 10) {
  print(i)
  i = i + 1
}

# Apply functions ----
# apply()
# sapply()
# lapply()

class(df[, 3])
apply(df, 2, class)

df = data.frame(
  x = c(1,5,7,8)
  , y = seq(0, 2, length.out = 4)
  , z = rep(7, 4)
)

apply(df, 1, mean)
apply(df, 2, mean)

result1 = lapply(df, mean) # returns a list
result2 = sapply(df, mean) # returns a vector

# Conditional statememnts ----
x = 5
x = 3

if (x > 4) {
  print('x is greater than 4')
}

if (x > 4) {
  print('x is greater than 4')
} else {
  print('x is not greater than 4')
}

if (x > 4) {
  print('x is greater than 4')
} else if (x < 4) {
  print('x is less than 4')
} else {
  print('x equals 4')
}

is.numeric(x)

# Writing custom functions ----
my_function = function(first_argument) {
  
  if (is.numeric(first_argument)) {
    sum_x = sum(first_argument)
    return(sum_x)
  } else {
    print('first_argument is not numeric')
  }

}

# x = c(5, 6, 8)
my_function(c(5, 6, 8))
my_function(c('5', 'xyz'))

df = data.frame(
  x = c(1,5,7,8)
  , y = seq(0, 2, length.out = 4)
  , z = rep(7, 4)
)

sapply(df, my_function)
sapply(df, function(first_argument) mean(first_argument))

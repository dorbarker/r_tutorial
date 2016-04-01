#################
#### R Syntax ###
#################

# Comments begin with a #
# Commented lines are not executed and are strictly for humans

##### Math works like you'd expect #####

1 + 2
# 3

3 / 4
# 0.75

6 * 6
# 36

# Order of operations is the usual BEDMAS

3 * 4 + 2
# 14

3 * (4 + 2)
# 18

# Exponentiation uses either ^ or ** ; pick your favourite

4 ^ 4
# 256

10 ** 3
# 1000

# modulo is the remainder of division; the modulo operator is %%

10 %% 3
# 1

20 %% 2
# 0

##### Booleans #####

# 'Booleans' aka 'logicals' are TRUE and FALSE

3 > 2
# TRUE

# Equality is tested with TWO equals signs

5 + 5 == 11
# FALSE

# Inequality is tested with !=

3 + 7 != 4
# TRUE

# TRUE and FALSE are equivalent to 1 and 0, respectively
# This seems a little weird but can be powerful as we'll show later

TRUE + TRUE
# 2

##### Variables #####

# Variables store values, and the stored value can be just about anything

# They can be named anything, as long as they don't contain special characters
# or begin with a number

# Variable assignment is done with an arrow <-

x <- 5

x + 9
# 14

# The RHS is calculated first before being assigned to the LHS

y <- 5 * 5 + 12 ^ 2 + 1

# Return the value contained in a variable by typing its name

y
# 170

# Variables can be modified after creation

y <- y - x
# 165

##### Strings #####

# Strings, aka characters, are the way text is handled in R
# Strings are defined by surrounding them with quote marks

s1 <- 'hello'
s2 <- 'world'

# Strings can be joined using paste()
paste(s1, s2)

# paste() puts one space between strings by default, but you can use other
# separator characters if you wish, as well as paste together more than just
# two strings at a time

paste(s1, 'goodbye', s2, sep = '-')

# You can make strings that are numbers, but you can't do math on them

# '5' + 5
# Error in "5" + 5 : non-numeric argument to binary operator

#### Data Structures ####

# Variables can be more compicated than holding single values.

## Vector ##
# The vector is the simplest data structure in R. It is a one-dimensional,
# ordered collection of values. Vectors can be created using the function c().

v <- c(2, 5, 78, 5, 10, 54, 9, 4)
v
# 2 5 78 5 10 54 9 4

# Vector elements can be accessed using their index, which counts from 1
v[3]
# 78

# You can test for presence with %in%

5 %in% v
# TRUE

# Operations performed on vectors are applied to each element of the vector.

v + 2
# 4 7 80 7 12 56 11 6

v < 10
# TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE

# Remember how booleans are equivalent to 1 and 0 ?

sum(v < 10)
# 5

## Matrix ##

# Matrices are two-dimensional vectors, and behave very similarly. They can be
# created from vectors like this:

m <- matrix(v, ncol = 2)
m
m * 2

# You can access (and write to) matrix elements in much the same way as vectors:

m[2,2] <- 9000
m

# With both vectors and matrices, all values must be of the same type. If the
# values have mixed types, R will try and convert them to the same type.

c('string', 42)
# 'string' '42'

## Data.Frame ##

# The Data.Frame is the most important data structure in R. It is much more
# flexible than a matrix. Data.Frames can contain any other value, and the
# value types can be mixed. These properties make Data.Frames roughly analogous
# to a spreadsheet.

# mtcars is a built-in data.frame often used as an example.
mtcars

# You can look at it graphically with View()
View(mtcars)

# head() and tail() will show you the first and last few rows, respectively
head(mtcars)

# ncol() and nrow() do what you'd expect

ncol(mtcars)
# 11

nrow(mtcars)
# 32

# rownames() and colnames() get the row and column names

rownames(mtcars)

# You can access data.frame rows and columns in by...

# index:
mtcars[2,3]
# 160

# or row and column name:
mtcars['Valiant', 'mpg']
# 18.1

# Retrieve an entire row or column, simply leave the other value blank
mtcars[,'cyl']

# summary() will give you a column-wise six-number summary
summary(mtcars)


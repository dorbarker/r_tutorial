#################
#### R Syntax ###
#################

# Comments begin with a #
# Commented lines are not executed and are strictly for humans

# If you're curious about anything, enter ?thing into the console.
# For example, this will display documentation of the max() function
?max

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

# Modulo is the remainder of division; the modulo operator is %%

10 %% 3
# 1

20 %% 2
# 0

##### Booleans #####

# 'Booleans' aka 'logicals' are TRUE and FALSE

# Greater than
3 > 2
# TRUE

# Less than or equal to
4 <= 4
# TRUE

# Equality is tested with TWO equals signs

5 + 5 == 11
# FALSE

# Inequality is tested with !=

3 + 7 != 4
# TRUE

# Negation is performed with a !

!TRUE
# FALSE

# Logical statements can be joined with a logical and (&) or a logical or (|)

TRUE | FALSE
# TRUE

TRUE & TRUE & FALSE
# FALSE

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
y
# 165

##### Strings #####

# Strings, aka characters, are the way text is handled in R
# Strings are defined by surrounding them with quote marks

s1 <- 'hello'
s2 <- 'world'

# Strings can be joined using paste()
paste(s1, s2)
# 'hello world'

# paste() puts one space between strings by default, but you can use other
# separator characters if you wish, as well as paste together more than just
# two strings at a time

paste(s1, 'goodbye', s2, sep = '-')
# 'hello-goodbye-world'

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

length(v)
# 8

# You can test for presence with %in%

5 %in% v
# TRUE

# Operations performed on vectors are applied to each element of the vector.

v + 2
# 4 7 80 7 12 56 11 6

v < 10
# TRUE TRUE FALSE TRUE FALSE FALSE TRUE TRUE

# Remember how booleans are equivalent to 1 and 0 ?

sum(v < 10)
# 5

# The reason the last three examples work is a little confusing, but will help
# make things make sense later: every string and number is a vector.
#
# 3 actually a vector with a length of 1. So is every other number.
# 3[1] is valid, though pointless. R does not see any fundamental difference
# between
# This quirk of the language means any


## Matrix ##

# Matrices are two-dimensional vectors, and behave very similarly. They can be
# created from vectors like this:

m <- matrix(v, ncol = 2)
m
m * 2

# Matricies can also be created row-wise
m2 <- matrix(v, byrow = TRUE, nrow = 2)
m2
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

# str will show the structure of the data given to it
str(mtcars)

# You can look at it graphically with View()
View(mtcars)

# head() and tail() will show you the first and last few rows, respectively
head(mtcars)

# nrow() and ncol() do what you'd expect

nrow(mtcars)
# 32

ncol(mtcars)
# 11

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

# You can also get multiple columns (or rows) by passing in a vector
mtcars[, c('mpg', 'cyl')]

# summary() will give you a column-wise six-number summary
summary(mtcars)

##### Functions #####

# Functions are a key component of any program. You've actually used a few in
# the examples above. For example, sum() is a function that returns the sum of
# a vector, matrix, or data.frame.

# Functions allow you to reuse code, which is of enormous importance for both
# reproducibility and your own sanity.
# Functions take zero or more arguments (aka paratemers, args, or parms), and
# do something. Often, a function will manipulate its arguments in some way and
# return a new value.

# This will create a new function called cube that raises its argument
# to the third power:

cube <- function(x) {
    x ^ 3
}

cube(3)
# 27

# Again, all numbers are vectors, so R is totally fine with:

cube( c(4, 5, 6) )
# 64 125 216

# Here's an example that takes two arguments, manipulates them,
# and returns a single value called out. You'll also notice that the inside of
# two_arg_example() is able to look out and use cube() which is defined above.

# In R, functions will return the last expression to have been evaluated.

two_arg_example <- function(a, b) {

    intermediate1 <- a ^ 0.5 + 3 / 2
    intermediate2 <- cube(b)

    out <- intermediate1 / intermediate2

    out

}

two_arg_example(42, 5)
# 0.06384593

##### Function Application #####

# Functions can be applied over a range of arguments.
# The apply family of functions take some kind of iterable object (vectors,
# lists, matrices, data.frames, etc) and pass each element to another function.
# If you have experience with MS Excel or LO Calc, this is similar to 'dragging'
# a function over a range of cells.

# Our vector from before:
v
# 2  5 78  5 10 54  9  4
max(v)
# 78

# The following will pass each column in mtcars to max()
# MARGIN = 1 would apply over rows instead

apply(mtcars, MARGIN = 2, FUN = max)
# mpg     cyl    disp      hp    drat      wt    qsec      vs      am    gear    carb
# 33.900   8.000 472.000 335.000   4.930   5.424  22.900   1.000   1.000   5.000   8.000

# Similarly, this will return vectors of the unique values in each column using
# the built-in function unique() :

apply(mtcars, 2, unique)

# Functions that take more than one parameter can have the additional parameters
# passed in from apply(). round() takes the number to be rounded and
# an argument digits, which is then number of decimal places after which the
# number is rounded.

round(3.14159, digits = 1)
# 3.1

apply(mtcars, 2, round, digits = 1)

# You can create ad hoc functions by using the function keyword
# but not binding it to a variable name.
#
# This, for example, will return the number of unique values in each column:

apply(mtcars, 2, function(x) length(unique(x)))
# mpg  cyl disp   hp drat   wt qsec   vs   am gear carb
# 25    3   27   22   22   29   30    2    2    3    6

# apply() passes each column of mtcars into the anonymous function as 'x'.
# The anonymous function then takes 'x', and passes it to unique(), which itself
# is the argument to length()

##### Conditionals & Control Flow #####

# The if-else chain is important in that it allows a program to have
# different behaviours for different inputs.

# If the 'if' condition evaluates to TRUE, the following block is executed, and
# the if-else chain exits. Otherwise, the next 'if' conditions are tested in
# order until one returns TRUE. If no if conditions are TRUE, the code in the
# 'else' block is executed.

ifelse_demo <- function(a) {

    if (a == 10) {
        print('Input is equal to ten')
    } else if (a < 10) {
        print('Input is less than ten')
    } else {
        print('Input is greater than ten')
    }
}

ifelse_demo(3)
ifelse_demo(99)
ifelse_demo(10)


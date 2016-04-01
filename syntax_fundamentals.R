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


#### Variables ####

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

y <- y - 100
# 70


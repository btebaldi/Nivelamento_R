#' ---
#' title: "R Data Types"
#' author: "Bruno Tebaldi de Queiroz Barbosa"
#' date: "2023-02-04"
#' output: html_document
#' ---
#' 


#' ### 1. Logical Data Type
#'
#' The logical data type in R is also known as boolean data type. It can only
#' have two values: TRUE and FALSE. For example,

bool1 <- TRUE
print(bool1)
print(class(bool1))

bool2 <- FALSE
print(bool2)
print(class(bool2))





#' ### 2. Numeric Data Type
#'
#' In R, the numeric data type represents all real numbers with or without
#' decimal values. For example,

# floating point values
weight <- 63.5
print(weight)
print(class(weight))

# real numbers
height <- 182
print(height)
print(class(height))


#' ### 3. Integer Data Type
#'
#' The integer data type specifies real values without decimal points. We use
#' the suffix L to specify integer data. For example,

integer_variable <- 186L
print(class(integer_variable))

#' Here, 186L is an integer data. So we get "integer" when we print the class of
#' integer_variable.

#' ### 4. Complex Data Type
#'
#' The complex data type is used to specify purely imaginary values in R. We use
#' the suffix i to specify the imaginary part. For example,

# 2i represents imaginary part
complex_value <- 3 + 2i

# print class of complex_value
print(class(complex_value))


#' Here, 3 + 2i is of complex data type because it has an imaginary part 2i.

#' ### 5. Character Data Type
#'
#' The character data type is used to specify character or string values in a
#' variable.

#' In programming, a string is a set of characters. For example, 'A' is a single
#' character and "Apple" is a string.
#'
#' You can use single quotes '' or double quotes "" to represent strings. In
#' general, we use: '' for character variables "" for string variables For
#' example,

# create a string variable
fruit <- "Apple"
print(class(fruit))

# create a character variable
my_char <- 'A'
print(class(my_char))

#' Here, both the variables - fruit and my_char - are of character data type.

#' ### 6. Raw Data Type
#'
#' A raw data type specifies values as raw bytes. You can use the following
#' methods to convert character data types to a raw data type and vice-versa:
#' 
#' charToRaw() - converts character data to raw data
#' 
#' rawToChar() - converts raw data to character data
#' 
#' For example,

# convert character to raw
raw_variable <- charToRaw("Nivelamento de R")
print(raw_variable)
print(class(raw_variable))
rawToBits(raw_variable)

# convert raw to character
char_variable <- rawToChar(raw_variable)

print(char_variable)
print(class(char_variable))


#' In this program,
#'
#' We have first used the charToRaw() function to convert the string
#' "Nivelamento de R to raw bytes.
#'
#' This is why we get "raw" as output when we print the class of raw_variable.
#' Then, we have used the rawToChar() function to convert the data in
#' raw_variable back to character form.
#'
#' This is why we get "character" as output when we print the class of
#' char_variable.



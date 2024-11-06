# Day-3 18/10/24 Tojin
# Lists in R
# Lists are objects in R programming that can contain elements of 
# different types such as strings, numbers, vectors, or even another list inside them.
# They can also contain matrices or functions as elements.
# A list is created using the list() function, making it a 1-dimensional heterogeneous
# data structure. The operations for accessing elements of a list or 
# changing their values are similar to operations on a vector.

# 1) Creating a vector of employee IDs
empID = c(100, 102, 103, 104)

# Creating a list with different elements
list1 = list(c("Jan", "Feb"), matrix(c(2, 4, 6), nrow=2), list("red", 15.8))

# Display the list
list1

# Giving names to the elements of the list
names(list1) = c("Months", "MatrixA", "list2")

# Display the names of the list elements
names(list1)

# Accessing the third element (list2) of the list
list1[[3]]  # This is equivalent to list1$list2

# Adding a new element to the end of the list
list1[4] = "New_data"

# Display the updated list
list1

# Removing the third element from the list
list1[3] = NULL

# Accessing the third element after removal (which no longer exists)
list1[3]  # This will return NULL

# Merging two lists
list1 = list(1, 2, 3)          # First list
list2 = list("M", "T", "W")    # Second list
mergedlist = c(list1, list2)   # Merging the two lists
mergedlist

# Converting a list to a vector using unlist()
v1 = unlist(list1)
v1

# Creating two lists and adding them (merging)
listA = list(10, 20, 30)
listB = list(40, 50, 60)
combinedList = c(listA, listB)  # Adding (merging) two lists
combinedList

# There are many ways to check what the datatype is:
# class(), typeof(), str(), is.<type>()

# Matrices are objects where the elements are arranged in a 2-dimensional layout.
# Although we can create matrices of logical values (TRUE/FALSE), strings, etc.,
# they are typically not useful in such cases, as matrices are primarily used for arithmetic operations.
# Therefore, matrices should ideally contain only numbers. 
# A matrix is created using the matrix() function.

# Create a matrix
M1 = matrix(c(2:13), nrow=4, byrow=FALSE)  # Fixed parentheses
M1

# Define names for the rows and columns
rownames = c("R1", "R2", "R3", "R4")  # Corrected row names
columns = c("C1", "C2", "C3")
M1 = matrix(c(2:13), nrow=4, byrow=FALSE, dimnames = list(rownames, columns))
M1

# Accessing the matrix
# Creating 2 matrices and performing arithmetic operations on them
matrix1 = matrix(c(1, 2, 3, 4), nrow=2)
matrix2 = matrix(c(5, 6, 7, 8), nrow=2)

# Performing arithmetic operations
sum_matrix = matrix1 + matrix2  # Matrix addition
prod_matrix = matrix1 * matrix2  # Element-wise multiplication

# Display the results
sum_matrix
prod_matrix

# Creating an array in R
# An array can hold multiple dimensions
my_array = array(1:12, dim = c(3, 4))  # Creating a 3x4 array
my_array

# Performing operations on arrays (e.g., summing over a dimension)
array_sum = apply(my_array, 1, sum)  # Sum over rows
array_sum

# Factors are data objects used to categorize data and arrange 
# them as levels. They can be strings or integers.
data = c("N", "S", "E", "W")
is.factor(data)  # Checking if 'data' is a factor

# We are getting FALSE, so let's convert it into a factor
factor_data = factor(data)
is.factor(factor_data)  # Now checking if 'factor_data' is a factor

# Why do we need factors?
# Factors are useful for statistical modeling, as they allow us to treat categorical variables appropriately.
# They can also help with memory efficiency and performance when working with large datasets.

# Data Frame - a table or a 2-dimensional array-like structure 
# in which each column contains values of one variable 
# and each row contains one set of values from each column. 
# Data in a dataframe can be of any type.
# Create a dataframe
emp.data = data.frame(
  emp_ID = c(1:5),
  emp_Name = c("tojin", "anitha", "Jithu", "Rima", "Tara"),
  emp_Age = c(25, 30, 28, 22, 35)
)
emp.data

# Structure of the dataframe
str(emp.data)

# Summary of the dataframe
summary(emp.data)

# What is the difference between character and factor?
# Characters are simple string variables, while factors are categorical variables 
# that can store string data as levels. Factors are useful for statistical analysis.

# Extracting employee names
result = emp.data$emp_Name
result

# Extract first 2 rows
result1 = emp.data[1:2,]  # We are extracting all columns
result1

# Extract 3rd and 5th row, 2nd and 3rd column
result2 = emp.data[c(3, 5), c(2, 3)]
result2

# To convert any numerical data like ID, house numbers, etc., 
# we convert to character or factor using as.character() or as.factor().

# Expanding the dataframe by adding a new column for department
emp.data$dept = c("A", "A", "B", "C", "A")  # Corrected to match row count
emp.data

# Adding a new row using rbind
emp.new = data.frame(
  emp_ID = c(6, 7, 8),
  emp_Name = c("Sam", "Alex", "kia"),  # Changed names for uniqueness
  emp_Age = c(35, 50, 39), 
  dept = c("C", "A", "B")  # Ensure department names match
)

# Ensure the new data frame has the same column names as emp.data
emp.final = rbind(emp.data, emp.new)

# Display the final combined dataframe
emp.final
# we can also use cbind function to add more columns to a dataframe
# cbind can aslo be used to combine vectors,matrices by column
 
#PART-B

# 1. Reshaping Matrices: Transposing a Matrix

# Create a matrix
matrix_data = matrix(1:6, nrow = 2, ncol = 3)

# Transpose the matrix
transposed_matrix = t(matrix_data)

# View the result
print("Transposed Matrix:")
print(transposed_matrix)


# 2. Reshaping Data Frames: Wide to Long Format

# Create a wide-format data frame
wide_df = data.frame(
  id = 1:3,
  time1 = c(10, 20, 30),
  time2 = c(15, 25, 35)
)

# Reshape to long format
long_df = reshape(wide_df, direction = "long", varying = c("time1", "time2"), 
                  v.names = "time", times = c(1, 2), idvar = "id")

# View the reshaped long-format data frame
print("Long-format Data Frame:")
print(long_df)


# 3. Using melt() and dcast() from the reshape2 Package

# Install the reshape2 package if not installed
# install.packages("reshape2")
library(reshape2)

# Create a sample data frame
data = data.frame(
  Student = c("John", "Alice", "Mark"),
  Math = c(90, 85, 78),
  Science = c(92, 88, 84),
  English = c(85, 90, 80)
)

# Melt the data frame to long format
long_data = melt(data, id.vars = "Student", variable.name = "Subject", value.name = "Marks")

# View the melted (long-format) data
print("Melted Long-format Data:")
print(long_data)

# Cast the data back to wide format
wide_data = dcast(long_data, Student ~ Subject, value.var = "Marks")

# View the wide-format data
print("Wide-format Data:")
print(wide_data)

#DAy1
x=c(3.1,4,3,4.1,5)
y1=x[1:4]
y3=x[-(1.5)]
x

assign("x",c(10.4,5.6,3.1,6.4,21.7))
c(10.4,5.6,3.1,6.4,21)
x=c(10.4,5.6,3.1,6.4,21.7)
X=c(10.4,8.6,3,6,21)
1/X


x[1]
x[]
x[length(x)]
x[c(2,3)]
x[-c(2,3)]
x[0]
x[1]<-5
x[c(2,3)]<-c(4,5)

seq(3,5)
seq(from=3,to =5)
seq(from=3,length=3,by=0.5)
seq(from=3,by=0.5,length=3)

paste("xyz",1:10)
paste("xyz",c(2,5,7,"test",4.5))
paste("xyz",1:10,sep="")
paste("xyz",1:10,sep="/")

rep(c(3,4,5),3)
rep(1:10,times=3)
X=c(1,2,3)
rep(x,each=3)
rep(x,each=3,times=3)


x=c(4:20)
which(x==10)
x[3]


myobject =c(1:10)
assign("myobject", 1:10)
myobject = c(1:10)
sentences = paste("R is great", c(4, 7, 45), "and I will love it")
print(sentences)
repeated_vector = c(rep(1, 11), rep(2, 10), rep(3, 10))
print(repeated_vector)

#DAy2

# Character vector of 5 friends' names
friends <- c("Amit", "Neha", "Rahul", "Priya", "Sanjay")
print(friends)

# Numerical vector of ages
age <- c(12, 25, 68, 70)
print(age)

# Sequence of numbers from 1 to 10
numbers <- 1:10
numbers

# create a vector of decimals
# length is used for length of vectror
length(age)
# sort function to sort vectors
sort(age)
sort(friends)
# use [] to access vector elements 
age[2]
friends[3]
# access values at multiple locations we use c
age[c(1,3)]
friends[c(2,3)]
age[0] # index always start with 1
# to access all expect 1 we use -
age[c(-1)]
age[-1]
 # to change any values in the vector
friends[1]="Tojin"
friends
# to repeat vectors we use rep function
repeat1=rep(c(2,4,6),each=4)
repeat1
repeat2=rep(c(2,4,6),times=3)
repeat2
# to repeat different values different number of times
repeat3=rep(c(2,4,6))times=c(5,3,2))
repeat3
#List - is collection of different types of data
# create a list of names
 list1=list("asha","azar","anita")
list1
# access the value of a list 

# change any vales in a list 

# length of a list
list[1]

# Day-4

# define statistics and explain why it is important for understanding and evaluateing data ?
# Statistics: Branch of math for collecting, analyzing, interpreting, and presenting data.

# Importance for Understanding and Evaluating Data:
# 1. Summarizes complex data (mean, median) for easier understanding.
# 2. Aids decision-making by measuring certainty (e.g., hypothesis testing).
# 3. Identifies patterns/trends (e.g., correlation, regression analysis).

#  Define and explain why statistics is important for data analytics?
# Importance for Data Analytics:
# 1. Provides methods to clean and preprocess raw data.
# 2. Offers tools for creating models and testing predictions.
# 3. Supports interpreting results, critical for insights and solutions.

# Quantitative data (numerical data) represents measurable quantities.

# Quantitative data (numerical data) represents measurable quantities.

# QUESTION 2

# 1. Discrete data: Whole numbers or counts.
discrete_data = c(3, 7, 10, 2, 5)  # Example of discrete data
print("Discrete Data:")
print(discrete_data)

# 2. Continuous data: Any value within a range, often with decimals.
continuous_data = c(1.2, 3.5, 4.8, 6.9, 2.3)  # Example of continuous data
print("Continuous Data:")
print(continuous_data)

# Qualitative data (categorical data) represents categories or labels.

# 3. Nominal data: Categories with no specific order (e.g., colors, brands).
nominal_data = factor(c("Red", "Blue", "Green"))  # Example of nominal data
print("Nominal Data:")
print(nominal_data)

# 4. Ordinal data: Categories with a meaningful order (e.g., rating scales).
ordinal_data = factor(c("Low", "Medium", "High"), ordered = TRUE)  # Example of ordinal data
print("Ordinal Data:")
print(ordinal_data)

# Multivariate data: Consists of more than one variable, often represented as a data frame in R.

# 5. Multivariate data frame with multiple variables (e.g., height, weight, and gender).
multivariate_data = data.frame(
  height = c(170, 165, 180),   # Continuous variable
  weight = c(65, 70, 75),      # Continuous variable
  gender = c("Male", "Female", "Male")  # Nominal variable
)
print("Multivariate Data Frame:")
print(multivariate_data)
# QUESTION 1
# 1. School Library - Track books borrowed from each genre per week.

# Define genres and weekly borrow counts
genres = c("Fiction", "Non-Fiction", "Science", "History", "Technology")
borrowed_books = c(45, 30, 25, 20, 15)  # Example counts for each genre

# Create data frame
library_data = data.frame(Genre = genres, Borrowed = borrowed_books)
print("Library Borrowed Books Data:")
print(library_data)

# 2. Student Survey - Favorite fruit preferences

# Define fruits and student preferences
fruits = c("Apples", "Bananas", "Oranges", "Grapes")
preferences = c(15, 10, 12, 13)  # Number of students for each fruit

# Create data frame
survey_data = data.frame(Fruit = fruits, Students = preferences)
print("Student Fruit Preference Survey Data:")
print(survey_data)

# 3. Weather Station - Daily rainfall record for a week

# Define days and rainfall in mm
days = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
rainfall_mm = c(5, 0, 3, 4, 6, 2, 8)  # Rainfall values for each day

# Create data frame
rainfall_data = data.frame(Day = days, Rainfall_mm = rainfall_mm)
print("Weekly Rainfall Data:")
print(rainfall_data)

# 4. Company Performance Evaluation - Employee performance tracking

# Define employee data
employees = c("Emp1", "Emp2", "Emp3")
tasks_completed = c(20, 18, 22)
hours_worked = c(40, 35, 45)
satisfaction_rating = c(8, 7, 9)  # Rating out of 10

# Create data frame
performance_data = data.frame(Employee = employees, Tasks = tasks_completed, Hours = hours_worked, Satisfaction = satisfaction_rating)
print("Employee Performance Evaluation Data:")
print(performance_data)

# QUESTION 3

# Define the genres
genres <- c("Fiction", "Non-Fiction", "Science", "History", "Technology")

# Generate random data for each genre for a week
# Assuming the range of books borrowed each week could be from 10 to 50
set.seed(123)  # Setting seed for reproducibility
books_borrowed <- sample(10:50, size = 5, replace = TRUE)

# Create a data frame to store the data
library_data <- data.frame(
  Genre = genres,
  Books_Borrowed = books_borrowed
)

# Display the data frame
print(library_data)


# QUESTIOn 4

# Load the 'moments' library for skewness and kurtosis calculations
if (!require(moments)) install.packages("moments", dependencies = TRUE)
library(moments)

# Define the coffee types
coffee_types <- c("Espresso", "Latte", "Cappuccino", "Americano", "Mocha")

# Generate random data for the number of coffees sold for each type
# Assuming each type sells between 20 and 100 cups daily
set.seed(123)  # Setting seed for reproducibility
coffees_sold <- sample(20:100, size = 5, replace = TRUE)

# Create a data frame to store the data
cafe_data <- data.frame(
  Coffee_Type = coffee_types,
  Cups_Sold = coffees_sold
)

# Display the data frame
print("Café Data:")
print(cafe_data)

# Calculate the mean (average) number of cups sold
mean_cups <- mean(cafe_data$Cups_Sold)

# Calculate the median (middle value) number of cups sold
median_cups <- median(cafe_data$Cups_Sold)

# Calculate the mode (most frequently occurring value)
mode_function <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}
mode_cups <- mode_function(cafe_data$Cups_Sold)

# Calculate the spread (variance and standard deviation)
variance_cups <- var(cafe_data$Cups_Sold)
sd_cups <- sd(cafe_data$Cups_Sold)

# Calculate skewness and kurtosis
skewness_cups <- skewness(cafe_data$Cups_Sold)
kurtosis_cups <- kurtosis(cafe_data$Cups_Sold)

# Display the results
cat("Mean of cups sold:", mean_cups, "\n")
cat("Median of cups sold:", median_cups, "\n")
cat("Mode of cups sold:", mode_cups, "\n")
cat("Variance of cups sold:", variance_cups, "\n")
cat("Standard deviation of cups sold:", sd_cups, "\n")
cat("Skewness of cups sold:", skewness_cups, "\n")
cat("Kurtosis of cups sold:", kurtosis_cups, "\n")



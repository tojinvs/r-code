# Load necessary libraries
library(readr)
library(ggplot2)
library(e1071)  # For skewness and kurtosis calculations

# Import the given "Mortality.csv" file as a data frame
mortality_data <- read.csv("C:/Users/digi_/OneDrive/Desktop/MCA/2nd sem/R-Code/Dataset1_Mortality.csv")

# View the imported data
head(mortality_data)

# --- PART A: DESCRIPTIVE STATISTICS AND ANSWERING QUESTIONS ---

# Question A: How many variables and observations does the dataset have?
observations <- nrow(mortality_data)
variables <- ncol(mortality_data)
cat("Number of Observations:", observations, "\n")
cat("Number of Variables:", variables, "\n")

# Question B: Extract Variable2 and Variable3 and assign them as vectors
# Note: Replace 'Variable2' and 'Variable3' with actual variable names from Mortality.csv
variable2_vector <- mortality_data$Variable2
variable3_vector <- mortality_data$Variable3

# Question C: How many different blood groups are in the dataset?
blood_groups <- length(unique(mortality_data$Blood_Group))
cat("Number of Blood Groups:", blood_groups, "\n")

# Question D: List the unique SMOKE categories
unique_smoke_categories <- unique(mortality_data$SMOKE)
cat("Unique SMOKE Categories:", unique_smoke_categories, "\n")

# Question E: How many had cholesterol levels above 300?
high_cholesterol <- sum(mortality_data$Cholesterol > 300, na.rm = TRUE)
cat("Number of Entries with Cholesterol Levels Above 300:", high_cholesterol, "\n")

# Question F: What is the mean height value for mortality status 'Alive'?
mean_height_alive <- mean(mortality_data$Height[mortality_data$Mortality_Status == "Alive"], na.rm = TRUE)
cat("Mean Height of Alive Mortality:", mean_height_alive, "\n")

# Question G: Find the age of the tallest person with O-Blood Group.
tallest_o_blood <- mortality_data$Age[which.max(mortality_data$Height[mortality_data$Blood_Group == "O"])]
cat("Age of the Tallest O-Blood Group Person:", tallest_o_blood, "\n")

# Question H: How many non-smokers are alive who are below 40 years of age?
nonsmokers_alive_below_40 <- sum(mortality_data$SMOKE == "No" & mortality_data$Mortality_Status == "Alive" & mortality_data$Age < 40, na.rm = TRUE)
cat("Nonsmokers Alive and Below 40 Years:", nonsmokers_alive_below_40, "\n")


# --- PART B: PLOTTING AND VISUALIZATIONS ---

# A. Single-variable plots using an example variable (replace 'Variable1' as needed)

# Bar Plot
barplot(table(mortality_data$Variable1), main = "Bar Plot of Variable1", col = "blue")

# Pie Chart
pie(table(mortality_data$Variable1), main = "Pie Chart of Variable1", col = rainbow(length(unique(mortality_data$Variable1))))

# Box Plot
boxplot(mortality_data$Variable1, main = "Box Plot of Variable1", col = "orange")

# Histogram
hist(mortality_data$Variable1, main = "Histogram of Variable1", col = "green", breaks = 10)

# B. Two-variable visualizations (replace 'Variable1' and 'Variable2' as needed)

# Bar Plot
barplot(table(mortality_data$Variable1, mortality_data$Variable2), main = "Two-Variable Bar Plot", col = c("blue", "green"), legend = rownames(table(mortality_data$Variable1)))

# Scatter Plot
plot(mortality_data$Variable1, mortality_data$Variable2, main = "Scatter Plot", xlab = "Variable1", ylab = "Variable2", col = "purple")

# Box Plot
boxplot(mortality_data$Variable1 ~ mortality_data$Variable2, main = "Box Plot of Variable1 by Variable2", col = "lightblue")

# C. Multivariable plots (use three or more variables for a detailed analysis)

# Multivariable Bar Plot
ggplot(mortality_data, aes(x = Variable1, fill = Variable2)) +
  geom_bar(position = "dodge") +
  ggtitle("Multivariable Bar Plot")

# Pair Plot
pairs(mortality_data[, c("Variable1", "Variable2", "Variable3")], main = "Pair Plot of Multiple Variables")

# --- PART C: DESCRIPTIVE STATISTICS FOR INBUILT DATASET (mtcars Example) ---

# Using 'mtcars' dataset for descriptive statistics example
data("mtcars")

# Calculate mean, median, mode, range, standard deviation, variance, skewness, kurtosis for 'mpg' in mtcars

# Mean
mean_value <- mean(mtcars$mpg)

# Median
median_value <- median(mtcars$mpg)

# Mode
mode_function <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}
mode_value <- mode_function(mtcars$mpg)

# Range
range_value <- range(mtcars$mpg)

# Standard Deviation
sd_value <- sd(mtcars$mpg)

# Variance
var_value <- var(mtcars$mpg)

# Skewness
skewness_value <- skewness(mtcars$mpg)

# Kurtosis
kurtosis_value <- kurtosis(mtcars$mpg)

# Display results for mtcars 'mpg'
cat("Mean:", mean_value, "\n")
cat("Median:", median_value, "\n")
cat("Mode:", mode_value, "\n")
cat("Range:", range_value, "\n")
cat("Standard Deviation:", sd_value, "\n")
cat("Variance:", var_value, "\n")
cat("Skewness:", skewness_value, "\n")
cat("Kurtosis:", kurtosis_value, "\n")

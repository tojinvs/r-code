# Load necessary libraries
library(readr)
library(ggplot2)
library(e1071)  # For skewness and kurtosis calculations

# Import the given "Dataset1_Mortality.csv" file as a data frame
mortality_data <- read.csv("C:/Users/digi_/OneDrive/Desktop/MCA/2nd sem/R-Code/Dataset1_Mortality.csv")

# View the imported data (first few rows)
head(mortality_data)

# --- PART A: DESCRIPTIVE STATISTICS AND ANSWERING QUESTIONS ---

# Question A: How many variables and observations does the dataset have?
observations <- nrow(mortality_data)
variables <- ncol(mortality_data)
cat("Number of Observations:", observations, "\n")
cat("Number of Variables:", variables, "\n")

# Question B: Extract HEIGHT and WEIGHT and assign them as vectors
height_vector <- mortality_data$HEIGHT
weight_vector <- mortality_data$WEIGHT

# Question C: How many different blood groups are in the dataset?
blood_groups <- length(unique(mortality_data$BLOOD))
cat("Number of Blood Groups:", blood_groups, "\n")

# Question D: List the unique SMOKE categories
unique_smoke_categories <- unique(mortality_data$SMOKE)
cat("Unique SMOKE Categories:", unique_smoke_categories, "\n")

# Question E: How many had cholesterol (CHOL) levels above 300?
high_cholesterol <- sum(mortality_data$CHOL > 300, na.rm = TRUE)
cat("Number of Entries with Cholesterol Levels Above 300:", high_cholesterol, "\n")

# Question F: What is the mean HEIGHT value for those with MORT status 'alive'?
mean_height_alive <- mean(mortality_data$HEIGHT[mortality_data$MORT == "alive"], na.rm = TRUE)
cat("Mean Height of Alive Individuals:", mean_height_alive, "\n")

# Question G: Find the age of the tallest person with blood group 'O'
tallest_o_blood <- mortality_data$AGE[which.max(mortality_data$HEIGHT[mortality_data$BLOOD == "o"])]
cat("Age of the Tallest O-Blood Group Person:", tallest_o_blood, "\n")

# Question H: How many nonsmokers are alive and below 40 years of age?
nonsmokers_alive_below_40 <- sum(mortality_data$SMOKE == "nonsmo" & mortality_data$MORT == "alive" & mortality_data$AGE < 40, na.rm = TRUE)
cat("Nonsmokers Alive and Below 40 Years:", nonsmokers_alive_below_40, "\n")

# --- PART B: PLOTTING AND VISUALIZATIONS ---

# Single-variable plots (using 'AGE' variable as an example)

# Bar Plot for 'BLOOD'
barplot(table(mortality_data$BLOOD), main = "Bar Plot of Blood Groups", col = "blue")

# Pie Chart for 'SMOKE'
pie(table(mortality_data$SMOKE), main = "Pie Chart of Smoking Categories", col = rainbow(length(unique(mortality_data$SMOKE))))

# Box Plot for 'AGE'
boxplot(mortality_data$AGE, main = "Box Plot of Age", col = "orange")

# Histogram for 'HEIGHT'
hist(mortality_data$HEIGHT, main = "Histogram of Height", col = "green", breaks = 10)

# Two-variable visualizations (using 'AGE' and 'CHOL')

# Bar Plot for 'AGE' by 'SMOKE' category
barplot(table(mortality_data$AGE, mortality_data$SMOKE), main = "Age by Smoking Category", col = c("blue", "green"), legend = rownames(table(mortality_data$AGE)))

# Scatter Plot for 'AGE' vs 'CHOL'
plot(mortality_data$AGE, mortality_data$CHOL, main = "Scatter Plot of Age vs Cholesterol", xlab = "Age", ylab = "Cholesterol", col = "purple")

# Box Plot of 'HEIGHT' by 'BLOOD' groups
boxplot(mortality_data$HEIGHT ~ mortality_data$BLOOD, main = "Box Plot of Height by Blood Group", col = "lightblue")

# Multivariable plots (using AGE, HEIGHT, and WEIGHT)

# Multivariable Bar Plot using ggplot2
ggplot(mortality_data, aes(x = AGE, fill = BLOOD)) +
  geom_bar(position = "dodge") +
  ggtitle("Multivariable Bar Plot of Age by Blood Group")

# Pair Plot of selected variables (AGE, HEIGHT, WEIGHT)
pairs(mortality_data[, c("AGE", "HEIGHT", "WEIGHT")], main = "Pair Plot of Age, Height, and Weight")

# --- PART C: DESCRIPTIVE STATISTICS FOR INBUILT DATASET (mtcars Example) ---

# Using 'mtcars' dataset for descriptive statistics example
data("mtcars")

# Calculate mean, median, mode, range, standard deviation, variance, skewness, kurtosis for 'mpg' in mtcars

# Mean
mean_value <- mean(mtcars$mpg)

# Median
median_value <- median(mtcars$mpg)

# Mode function
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

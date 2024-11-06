# Load necessary library
library(reshape2)

# Step 1: Create a Matrix with Student Names and Marks

# Create vectors of student names and marks
student_names <- c("Tojin", "Tobin", "Simson")
math_marks <- c(85, 78, 92)
science_marks <- c(90, 80, 88)
english_marks <- c(75, 85, 80)

# Create a matrix with student names as column names
student_matrix <- matrix(c(math_marks, science_marks, english_marks), 
                         nrow = 3, 
                         byrow = TRUE)
colnames(student_matrix) <- student_names
rownames(student_matrix) <- c("Math", "Science", "English")

# Print the original matrix
print("Original Student Matrix:")
print(student_matrix)

# Transpose the matrix to make subjects as rows and students as columns
student_matrix_transposed <- t(student_matrix)

# Print the transposed matrix
print("Transposed Student Matrix:")
print(student_matrix_transposed)

# Step 2: Create Data Frames for Midterm and Endterm Marks

# Create midterm and endterm data frames
midterm <- data.frame(
  Student = c("Tojin", "Tobin", "Simson"),
  Math = c(85, 78, 92),
  Science = c(90, 80, 88),
  English = c(75, 85, 80)
)

endterm <- data.frame(
  Student = c("Tojin", "Tobin", "Simson"),
  Math = c(88, 82, 95),
  Science = c(92, 85, 90),
  English = c(80, 90, 85)
)

# Merge midterm and endterm by student names
merged_data <- merge(midterm, endterm, by = "Student", suffixes = c("_Mid", "_End"))

# Compute total and average marks for each student
merged_data$Total <- rowSums(merged_data[, c("Math_Mid", "Science_Mid", "English_Mid", 
                                             "Math_End", "Science_End", "English_End")])
merged_data$Average <- merged_data$Total / 6  # 6 subjects total

# Print the merged data with total and average marks
print("Merged Data Frame with Total and Average Marks:")
print(merged_data)

# Melt the merged data frame into a long format
long_format <- melt(merged_data, id.vars = "Student", 
                    measure.vars = c("Math_Mid", "Science_Mid", "English_Mid", 
                                     "Math_End", "Science_End", "English_End"))

# Print the long format data frame
print("Long Format of Merged Data:")
print(long_format)

# Cast the melted data frame back to a wide format
wide_format <- dcast(long_format, Student ~ variable, value.var = "value")

# Print the wide format data frame
print("Wide Format of Merged Data:")
print(wide_format)

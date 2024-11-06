# 1. Create vectors to store employee names, departments, and their performance scores over 3 quarters

# Employee names vector
employee_names = c("Tojin", "Tobin", "Mini", "Simson",  # HR
                   "JB", "Jboi", "Evu", "Anish",  # IT
                   "Angel", "Jomon", "Jobi", "Joseph")  # Sales

# Departments vector
departments = c(rep("HR", 4), rep("IT", 4), rep("Sales", 4))

# Performance scores for 3 quarters
q1_scores = c(78, 85, 90, 80, 92, 88, 95, 85, 76, 83, 88, 90)  # Q1 scores
q2_scores = c(82, 79, 92, 87, 85, 90, 94, 88, 79, 85, 86, 89)  # Q2 scores
q3_scores = c(81, 86, 93, 84, 89, 87, 92, 90, 80, 87, 85, 88)  # Q3 scores

# 2. Combine performance scores of three-quarters vectors into a matrix for analysis
performance_matrix = cbind(employee_names,departments,q1_scores, q2_scores, q3_scores)

# View the performance matrix
print("Performance Matrix:")
print(performance_matrix)

# 3. Convert the matrix into a data frame with department and employee names as additional columns
employee_performance_df = data.frame(
  Employee = employee_names,
  Department = departments,
  Q1 = q1_scores,
  Q2 = q2_scores,
  Q3 = q3_scores
)

# View the data frame
print("Employee Performance Data Frame:")
print(employee_performance_df)

# 4. Modify employee performance scores in the matrix and data frame
# Suppose Tojin improved his performance in Q2, we update the score
performance_matrix[4, 2] = 100  # Update Tojin's Q2 score in matrix
employee_performance_df$Q2[4] = 100  # Update in data frame

# View the updated data
print("Updated Performance Matrix:")
print(performance_matrix)
print("Updated Data Frame:")
print(employee_performance_df)

# 5. Calculate the average performance score per employee and per department
# Average per employee
employee_performance_df$Average = rowMeans(employee_performance_df[, 3:5])

# Average per department
average_per_department = aggregate(employee_performance_df$Average, 
                                   by = list(Department = employee_performance_df$Department), 
                                   FUN = mean)
colnames(average_per_department)[2] = "Average_Per_Department"

# View the averages
print("Average Performance Per Employee:")
print(employee_performance_df)
print("Average Performance Per Department:")
print(average_per_department)
#..
# Calculate the average performance score per employee
employee_performance_df$Average = rowMeans(employee_performance_df[, 3:5])

# Create a separate named vector with Employee names as row names and their Average Performance
employee_average = setNames(employee_performance_df$Average, employee_performance_df$Employee)

# View the employee names and their averages
print("Average Performance Per Employee:")
print(employee_average)

# 6. Add a new employee's performance data to the data frame
new_employee = data.frame(
  Employee = "Jake",
  Department = "Sales",
  Q1 = 87, Q2 = 89, Q3 = 90,
  Average = mean(c(87, 89, 90))
)

# Add to data frame
employee_performance_df = rbind(employee_performance_df, new_employee)

# View the updated data frame
print("Data Frame with New Employee:")
print(employee_performance_df)

# 7. Organize the data (vectors, matrix, data frame, calculations) into a list for easy access
evaluation_list = list(
  Employee_Names = employee_names,
  Departments = departments,
  Performance_Matrix = performance_matrix,
  Performance_Data_Frame = employee_performance_df,
  Average_Per_Employee = employee_performance_df$Average,
  Average_Per_Department = average_per_department
)

# View the list
print("Evaluation List:")
print(evaluation_list)

# 8. Delete the performance data for one employee from the matrix and the data frame
# Find the index of "Mini" in the data frame
mini_index = which(employee_performance_df$Employee == "Mini")

# Remove from matrix (row corresponding to Mini)
performance_matrix = performance_matrix[-mini_index, ]

# Remove from data frame
employee_performance_df = employee_performance_df[-mini_index, ]

# Reset the row numbers for the matrix
rownames(performance_matrix) <- seq_len(nrow(performance_matrix))

# Reset the row numbers for the data frame
rownames(employee_performance_df) <- seq_len(nrow(employee_performance_df))

# View the updated data after deletion
print("Updated Performance Matrix after removing Mini:")
print(performance_matrix)

print("Updated Data Frame after removing Mini:")
print(employee_performance_df)

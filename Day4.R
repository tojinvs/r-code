# Day-4
# Define a vector x with a series of values
x = c(2, 3, 5, 1, 2, 8, 6, 3, 5, 0)  # Vector of values

# Display the vector x
x  # Print x

# Calculate the absolute frequency of each unique value in x
table(x)  # Table of absolute frequencies

# Calculate the total number of elements in x
length(x)  # Number of elements in x

# Calculate the relative frequency of each unique value in x
table(x) / length(x)  # Relative frequency

# Frequency distribution example using time data
time = c(32, 35, 45, 83, 74, 55, 68, 38, 35, 55, 66, 65, 42, 68, 72, 84, 67, 36, 42, 58)  # Time data vector
time  # Print time data

# Range of the data values; calculated as max - min
range(time)  # Range of values in time

# Define break intervals for grouping data
breaks = seq(30, 90, by = 10)  # Intervals for time data
breaks  # Print intervals

# Convert numeric time data to categories based on the defined intervals using cut()
time.cut = cut(time, breaks, right = FALSE)  # Categorize time data based on intervals
table(time.cut)  # Frequency distribution of time data

# Make the table vertical for better readability
cbind(table(time.cut))  # Convert to vertical table

# Relative frequency with respect to intervals
table(time.cut) / length(time.cut)  # Relative frequency for each interval
cbind(table(time.cut) / length(time.cut))  # Display relative frequencies vertically

# Cumulative frequencies for relative frequencies
cumsum(table(time.cut) / length(time.cut))  # Cumulative sum of relative frequencies

# Display cumulative frequencies in a vertical table
cbind(cumsum(table(time.cut) / length(time.cut)))  # Vertical cumulative frequencies



# DAY-5

# Bar diagram
?barplot()
#or 
help("barplot")


quali=c(1,2,1,2,1,1,1,2,1,1)
quali
barplot(quali)
table(quali)
barplot(table(quali))
barplot(table(quali)/length(quali),horiz=TRUE,main="qualification of Persons",names.arg=c("Graduates","NonGraduates"),xlab="Qalification",ylab="Relative frequency",col=c("red","green"))
cust=matrix(nrow=4,ncol=3,data=c(2,20,30,2,6,53,34,53,21,12,13,14))
cust
barplot(cust,ylab="cumlative freq",xlab="Shops",names.arg=c("Shop1,Shop2,Shop3"),col=c("red","blue","green"))

pie(table(quali))
pie(table(quali),main="Qualification of persons",labels=c("Graduate","nongraduate"),col=c("red","blue"))
library(plotrix)
pie3D(table(quali),explode=0.2,main="Qualification of persons",labels=c("Graduate","nongraduate"),col=c("red","blue"))

height=c(125,133,135,156,167,145,134,166,155,154,166,154,144,164,133,143,134,145,122,166,158,147,138,160)
hist(height)

plot(density(height))
plot(density(height,adjust=0.5))
plot(density(height,adjust=1))
plot(density(height,adjust=2))

#Quantites
height=c(125,133,135,156,167,145,134,166,155,154,166,154,144,164,133,143,134,145,122,166,158,147,138,160)
quantile(height)
probs=seq(0,1,0.25)
probs
quantile(height,probs=seq(0,1,0.25))
quantile(height,probs=seq(0,1,0.10))
quantile(height,probs=seq(0,1,0.01))
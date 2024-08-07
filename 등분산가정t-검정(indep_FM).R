library(readxl)

# Load the data from the Excel file
file_path <- "강의참고자료/9주차/indep_FM.xlsx"
data <- read_excel(file_path)

# Extract the data for Finance and Marketing
finance <- data$Finance
marketing <- data$Marketing

# Perform one-tailed t-test (right-tailed, i.e., finance > marketing)
t_test_result <- t.test(finance, marketing, alternative = "greater", var.equal = TRUE)

# Print the results
print(t_test_result)

library(readxl)

# Load the data from the Excel file
file_path <- "강의참고자료/9주차/paired_FM.xlsx"
data <- read_excel(file_path)

# Extract the data for Finance and Marketing
finance <- data$Finance
marketing <- data$Marketing

# Perform paired t-test (right-tailed)
paired_t_test_result <- t.test(finance, marketing, paired = TRUE, alternative = "greater")

# Print the results
print(paired_t_test_result)

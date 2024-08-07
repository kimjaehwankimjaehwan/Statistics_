install.packages("readxl")
library(readxl)

# Load the data from the Excel file
file_path <- "강의참고자료/9주차/indep_FM.xlsx"
data <- read_excel(file_path)

# Extract the data for Finance and Marketing
finance <- data$Finance
marketing <- data$Marketing

# Perform F-test
f_test <- var.test(finance, marketing, alternative = "greater")

# Print the results
print(f_test)

getwd()

import pandas as pd
import numpy as np
from scipy.stats import t

# Load the data from the Excel file
file_path = "C:\\Users\\김재환\\OneDrive\\바탕 화면\\대학원\\2024-3학기\\경영통계와 의사결정\\강의참고자료\\9주차\\paired_FM.xlsx"
data = pd.read_excel(file_path)

# Extract the data for Finance and Marketing
finance = data['Finance']
marketing = data['Marketing']
# print(finance)
# print(marketing)
# Calculate the differences
differences = finance - marketing
# print(differences)
# Calculate the sample mean of the differences
mean_difference = np.mean(differences)

# Calculate the sample standard deviation of the differences
var_difference = np.var(differences, ddof=1)

# Calculate the sample size
n = len(differences)

# Calculate the t-statistic
t_stat = mean_difference / (np.sqrt(var_difference/n))

# Calculate the p-value for the one-tailed test (right-tailed)
p_value_one_tailed = 1 - t.cdf(t_stat, df=n-1)

# Print the results
print(f"t-statistic: {t_stat}")
print(f"P-value (one-tailed): {p_value_one_tailed}")

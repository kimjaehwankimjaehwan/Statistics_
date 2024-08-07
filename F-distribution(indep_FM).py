import pandas as pd
from scipy.stats import f

# Load the data from the Excel file
file_path = "C:\\Users\\김재환\\OneDrive\\바탕 화면\\대학원\\2024-3학기\\경영통계와 의사결정\\강의참고자료\\9주차\\indep_FM.xlsx"
data = pd.read_excel(file_path)

# Extract the data for Finance and Marketing
finance = data['Finance']
marketing = data['Marketing']

# Calculate variances
var_finance = finance.var(ddof=1)  # Sample variance
var_marketing = marketing.var(ddof=1)  # Sample variance

# Calculate the F-statistic
f_stat = var_finance / var_marketing

# Degrees of freedom
df1 = len(finance) - 1
df2 = len(marketing) - 1

# Calculate the p-value for the two-tailed test
p_value = 2 * min(f.cdf(f_stat, df1, df2), 1 - f.cdf(f_stat, df1, df2))

# Print the results
print(f"F-statistic: {f_stat}")
print(f"P-value: {p_value}")

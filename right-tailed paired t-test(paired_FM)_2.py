import pandas as pd
from scipy.stats import ttest_rel

# Load the data from the Excel file
file_path = "C:\\Users\\김재환\\OneDrive\\바탕 화면\\대학원\\2024-3학기\\경영통계와 의사결정\\강의참고자료\\9주차\\paired_FM.xlsx"
data = pd.read_excel(file_path)

# Extract the data for Finance and Marketing
finance = data['Finance']
marketing = data['Marketing']

# Perform paired t-test (two-tailed)
t_stat, p_value_two_tailed = ttest_rel(finance, marketing)

# Adjust p-value for one-tailed test (right-tailed)
if t_stat > 0:
    p_value_one_tailed = p_value_two_tailed / 2
else:
    p_value_one_tailed = 1 - (p_value_two_tailed / 2)

# Print the results
print(f"t-statistic: {t_stat}")
print(f"P-value (one-tailed): {p_value_one_tailed}")

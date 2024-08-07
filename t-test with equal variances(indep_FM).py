import pandas as pd
from scipy.stats import ttest_ind

# Load the data from the Excel file
file_path = "C:\\Users\\김재환\\OneDrive\\바탕 화면\\대학원\\2024-3학기\\경영통계와 의사결정\\강의참고자료\\9주차\\indep_FM.xlsx"
data = pd.read_excel(file_path)

# Extract the data for Finance and Marketing
finance = data['Finance']
marketing = data['Marketing']

# Perform one-tailed t-test (right-tailed, i.e., finance > marketing)
t_stat, p_value = ttest_ind(finance, marketing, alternative='greater', equal_var=True)

# Print the results
print(f"t-statistic: {t_stat}")
print(f"P-value: {p_value}")

import pandas as pd
from scipy.stats import ttest_ind
data = pd.read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/indep_FM.xlsx")
t_stat, p_value = ttest_ind(data['Finance'], data['Marketing'], equal_var=True)
print("t-statistic:", t_stat)
print("p-value:", p_value)

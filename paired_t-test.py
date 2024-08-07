import pandas as pd
from scipy.stats import ttest_rel

# 데이터 불러오기
data = pd.read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/paired_FM.xlsx")

# Paired t-test 수행
t_stat, p_value = ttest_rel(data['Finance'], data['Marketing'])
print(f"T-statistic: {t_stat}, P-value: {p_value}")

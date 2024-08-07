import pandas as pd
import numpy as np
from scipy.stats import chi2_contingency

# 데이터 불러오기
data = pd.read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/indep_FM.xlsx")

# 연봉 데이터를 세 범주로 나누기
data['Finance_cat'] = pd.qcut(data['Finance'], q=[0, .33, .67, 1], labels=["Low", "Medium", "High"])
data['Marketing_cat'] = pd.qcut(data['Marketing'], q=[0, .33, .67, 1], labels=["Low", "Medium", "High"])

# 교차표 생성
cross_tab = pd.crosstab(data['Finance_cat'], data['Marketing_cat'])

# 카이제곱 검정 수행
chi2, p, dof, expected = chi2_contingency(cross_tab)
print("Chi-squared Test Statistic:", chi2)
print("p-value:", p)
print("Degrees of Freedom:", dof)
print("Expected Frequencies:\n", expected)

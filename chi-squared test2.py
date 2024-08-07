import pandas as pd
from scipy.stats import chi2_contingency

# Excel 파일 불러오기
data = pd.read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/paired_FM.xlsx")

# 데이터를 범주형으로 변환
data['Finance_cat'] = pd.cut(data['Finance'], bins=3, labels=["Low", "Medium", "High"])
data['Marketing_cat'] = pd.cut(data['Marketing'], bins=3, labels=["Low", "Medium", "High"])

# 테이블 생성
contingency_table = pd.crosstab(data['Finance_cat'], data['Marketing_cat'])

# 카이제곱 검정 수행
chi2, p, dof, expected = chi2_contingency(contingency_table)
print(f"Chi-squared: {chi2}, p-value: {p}, Degrees of freedom: {dof}")

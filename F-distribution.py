import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import f

# 자유도 설정
numerator_dfs = [5, 10, 15]   # 분자의 자유도
denominator_dfs = [10, 20, 30] # 분모의 자유도

# 값의 범위 설정
x = np.linspace(0, 5, 100)

# 그래프 그리기
plt.figure(figsize=(10, 6))

for num_df, den_df in zip(numerator_dfs, denominator_dfs):
    # 확률 밀도 계산
    y = f.pdf(x, num_df, den_df)
    # 그래프에 선 추가
    plt.plot(x, y, label=f'Num DF={num_df}, Den DF={den_df}')

plt.title('F Distribution')
plt.xlabel('Value')
plt.ylabel('Probability Density')
plt.legend(title='Degrees of Freedom')
plt.grid(True)
plt.show()

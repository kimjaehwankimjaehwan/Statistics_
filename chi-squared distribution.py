import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import chi2

# 자유도 설정
degrees_of_freedom = [2, 5, 10]

# 값의 범위 설정
x = np.linspace(0, 20, 100)

# 그래프 그리기
plt.figure(figsize=(12, 9))

for df in degrees_of_freedom:
    plt.plot(x, chi2.pdf(x, df), label=f'DF={df}')

plt.title('Chi-Squared Distribution')
plt.xlabel('Value')
plt.ylabel('Probability Density')
plt.legend(title='Degrees of Freedom')
plt.grid(True)
plt.show()

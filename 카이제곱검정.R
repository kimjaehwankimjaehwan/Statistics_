# 필요한 패키지 로드
library(readxl)

# 데이터 불러오기
data <- read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/indep_FM.xlsx")

# 연봉 데이터를 세 범주로 나누기
breaks <- quantile(data$Finance, probs = c(0.33, 0.67), na.rm = TRUE)
data$Finance_cat <- cut(data$Finance, breaks = c(-Inf, breaks, Inf), labels = c("Low", "Medium", "High"))
breaks <- quantile(data$Marketing, probs = c(0.33, 0.67), na.rm = TRUE)
data$Marketing_cat <- cut(data$Marketing, breaks = c(-Inf, breaks, Inf), labels = c("Low", "Medium", "High"))
data
# 교차표 생성
table_data <- table(data$Finance_cat, data$Marketing_cat)
print(table_data)
# 카이제곱 검정 수행
chisq.test(table_data)

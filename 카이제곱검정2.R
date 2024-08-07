library(readxl)
library(dplyr)

# Excel 파일 불러오기
data <- read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/paired_FM.xlsx")

# 데이터를 범주형으로 변환
data$Finance_cat <- cut(data$Finance, breaks=3, labels=c("Low", "Medium", "High"))
data$Marketing_cat <- cut(data$Marketing, breaks=3, labels=c("Low", "Medium", "High"))

# 테이블 생성
table_data <- table(data$Finance_cat, data$Marketing_cat)

# 카이제곱 검정 수행
chisq.test(table_data)

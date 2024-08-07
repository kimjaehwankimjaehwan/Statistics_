# readxl 패키지 설치
install.packages("readxl")

# 패키지 불러오기
library(readxl)

# Excel 파일 불러오기
data <- read_excel("C:/Users/aj/OneDrive/바탕 화면/대학원/2024-3학기/경영통계와 의사결정/강의참고자료/9주차/paired_FM.xlsx")

# Paired t-test 수행
t.test(data$Finance, data$Marketing, paired = TRUE)

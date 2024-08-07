install.packages("readxl")
library(readxl)

my_data <- read_excel("bigbang.xlsx")

# #xlsx 패키지
# xlsx 패키지는 Java에 의존적이므로 Java가 설치되어 있어야 합니다. 다양한 옵션을 제공하지만, 설정이 조금 더 복잡할 수 있습니다.

# xlsx 패키지 설치 및 로드
install.packages("xlsx")
library(xlsx)

# Excel 파일 읽기
my_data <- read.xlsx("bigbang.xlsx", sheetIndex = 1)


class(my_data)
View(my_data)

# 여기서부터 시작
library(readxl)
library(ggplot2)

# Excel 파일에서 데이터 읽기
data <- read_excel("bigbang.xlsx")

# 빅뱅이론을 시청한 사람들의 수 계산
big_bang_watchers <- sum(data$TV_Program == 2)

# 총 표본 크기
n <- nrow(data)

# 표본 비율 계산
p_hat <- big_bang_watchers / n

# 표본 비율의 표준 오차 계산
se <- sqrt(p_hat * (1 - p_hat) / n)

# Z 점수 범위 설정 (-3, 3) 표준 정규 분포의 대부분을 커버
z_scores <- seq(-3, 3, length.out = 1000)

# Z 점수에 대한 확률 밀도 계산
pdf_values <- dnorm(z_scores)

# 시각화
ggplot(data.frame(z_scores, pdf_values), aes(z_scores, pdf_values)) +
  geom_line() +
  geom_vline(xintercept = (p_hat - p_hat) / se, color = "blue") +
  xlab("Z score") +
  ylab("Density") +
  ggtitle("Sample Distribution of Proportion Watching Big Bang Theory")


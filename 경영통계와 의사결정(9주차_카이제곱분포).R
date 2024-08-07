# 필요한 패키지를 로드합니다
if (!require(ggplot2)) install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

# 카이제곱 분포의 자유도 설정
degrees_of_freedom <- c(2, 5, 10)

# 데이터 프레임 생성
df <- data.frame(
  x = seq(0, 20, length.out = 100),
  df = factor(rep(degrees_of_freedom, each = 100))
)

# 확률 밀도 계산
df$y <- dchisq(df$x, df = as.numeric(as.character(df$df)))

# 그래프 생성
ggplot(df, aes(x = x, y = y, color = df)) +
  geom_line() +
  labs(title = "Chi-Squared Distribution",
       subtitle = "Curves for different degrees of freedom",
       x = "Value",
       y = "Probability Density",
       color = "Degrees of Freedom") +
  theme_minimal()

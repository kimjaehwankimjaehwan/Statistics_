# 필요한 패키지를 로드합니다
if (!require(ggplot2)) install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

# F-분포의 자유도 설정
numerator_df <- c(5, 10, 15)   # 분자의 자유도
denominator_df <- c(10, 20, 30) # 분모의 자유도

# 값의 범위 설정
x_values <- seq(0, 5, length.out = 100)

# 데이터 프레임 생성
df <- expand.grid(
  x = x_values,
  num_df = numerator_df,
  den_df = denominator_df
)

# 확률 밀도 계산
df$y <- with(df, df(x, num_df, den_df))

# 그래프 생성
ggplot(df, aes(x = x, y = y, color = interaction(num_df, den_df))) +
  geom_line() +
  labs(title = "F Distribution",
       subtitle = "Curves for different degrees of freedom",
       x = "Value",
       y = "Probability Density",
       color = "Numerator/Denominator DF") +
  scale_color_brewer(palette = "Dark2") +
  theme_minimal()

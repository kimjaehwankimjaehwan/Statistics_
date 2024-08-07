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

# 95% 신뢰구간 계산
z_alpha_2 <- qnorm(0.975)  # 95% 신뢰수준에서의 Z 점수
ci_lower <- p_hat - z_alpha_2 * se
ci_upper <- p_hat + z_alpha_2 * se

# 신뢰구간과 Z 점수 계산
z_lower <- (ci_lower - p_hat) / se
z_upper <- (ci_upper - p_hat) / se

# 시각화
plot <- ggplot(data.frame(z_scores = seq(-3, 3, length.out = 1000)), aes(x = z_scores)) +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1), colour = "black") +
  geom_ribbon(aes(ymin = 0, ymax = dnorm(z_scores)), fill = "blue", alpha = 0.2) +
  geom_vline(xintercept = z_lower, color = "blue", linetype = "dashed") +
  geom_vline(xintercept = z_upper, color = "blue", linetype = "dashed") +
  xlab("Z score") +
  ylab("Density") +
  ggtitle("95% Confidence Interval for Proportion Watching 'The Big Bang Theory'")

# 신뢰구간이 Z 점수의 범위를 벗어나지 않도록 보정
plot + xlim(-3, 3)

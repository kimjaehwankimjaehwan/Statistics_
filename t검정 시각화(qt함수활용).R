# 필요한 라이브러리 로드
library(ggplot2)

# 샘플 데이터 생성
{set.seed(123)
n <- 30  # 표본 크기
sample_data <- rnorm(n, mean = 50, sd = 10)
sample_mean <- mean(sample_data)
sample_sd <- sd(sample_data)
df <- n - 1  # 자유도

# t-분포의 밀도 함수를 시각화하기 위한 데이터 프레임 생성
t_values <- seq(-4, 4, length.out = 1000)
t_density <- dt(t_values, df = df)
t_data <- data.frame(t_values, t_density)


# 95% 신뢰구간에 해당하는 t 값 계산
lower_t <- qt(0.025, df)
upper_t <- qt(0.975, df)

# t-분포 밀도 그래프와 95% 신뢰구간 강조
t_dist_plot <- ggplot(t_data, aes(x = t_values, y = t_density)) +
  geom_line(color = "blue", size = 1) +
  geom_area(data = t_data[t_data$t_values >= lower_t & t_data$t_values <= upper_t, ],
            aes(x = t_values, y = t_density), fill = "blue", alpha = 0.3) +
  labs(title = "T-Distribution with Confidence Interval",
       subtitle = paste("Sample size =", n, ", Degrees of freedom =", df),
       x = "T value", y = "Density") +
  geom_vline(xintercept = lower_t, linetype = "dashed", color = "red") +
  geom_vline(xintercept = upper_t, linetype = "dashed", color = "red") +
  theme_minimal()

# 그래프 출력
print(t_dist_plot)
}


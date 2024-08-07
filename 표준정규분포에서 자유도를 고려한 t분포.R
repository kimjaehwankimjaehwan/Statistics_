library(ggplot2)

# 샘플 데이터 생성
set.seed(123)
n <- 20
sample_data <- rnorm(n, mean = 50, sd = 10)
sample_mean <- mean(sample_data)
sample_sd <- sd(sample_data)

# 자유도
df <- n - 1

# t 분포의 밀도 함수를 시각화
t_values <- seq(-4, 4, length.out = 1000)
t_density <- dt(t_values, df = df)

# ggplot2를 사용한 t 분포 시각화
t_dist_plot <- ggplot(data = data.frame(t_values, t_density), aes(x = t_values, y = t_density)) +
  geom_line() +
  labs(title = "T-distribution with df = n-1",
       x = "t value",
       y = "Density") +
  geom_vline(xintercept = c(-qt(0.975, df), qt(0.975, df)), color = "blue", linetype = "dashed") +
  annotate("text", x = qt(0.975, df), y = 0, label = "97.5% Quantile", vjust = 2) +
  annotate("text", x = -qt(0.975, df), y = 0, label = "-97.5% Quantile", vjust = 2)

# 플롯 출력
print(t_dist_plot)

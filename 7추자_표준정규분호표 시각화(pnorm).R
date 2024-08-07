# 표준 정규 분포의 누적 분포 함수(CDF)를 위한 x 값 범위 생성
{x <- seq(-4, 4, length.out = 1000)
y <- pnorm(x, mean = 0, sd = 1)

# CDF 그래프 그리기
plot(x, y, type = 'l', main = "표준 정규 분포의 누적 분포 함수 및 95% 신뢰구간", xlab = "x", ylab = "누적 확률")

# 95% 신뢰구간 계산 (표준 정규 분포에서의 2.5%와 97.5% 분위수)
lower_bound <- qnorm(0.025)
upper_bound <- qnorm(0.975)

# 신뢰구간 강조를 위해 채우기 영역 추가
x_fill <- x[x >= lower_bound & x <= upper_bound]
y_fill <- y[x >= lower_bound & x <= upper_bound]
polygon(c(lower_bound, x_fill, upper_bound), c(0, y_fill, y_fill[1]), col = 'skyblue', border = NA)

# 신뢰구간 경계선 추가
abline(v = lower_bound, col = 'blue', lty = 2)
abline(v = upper_bound, col = 'blue', lty = 2)

# 범례 추가
legend("bottomright", legend = c("95% CI"), fill = c("skyblue"), border = "blue")
}



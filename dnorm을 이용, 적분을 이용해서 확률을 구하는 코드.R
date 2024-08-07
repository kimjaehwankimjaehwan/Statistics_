# dnorm으로 PDF 값을 계산하는 함수 정의
dnorm_pdf <- function(x) {
  dnorm(x, mean = 0, sd = 1)
}

# -1.96과 1.96 사이의 확률을 적분하여 구함
# 이 구간은 표준 정규 분포에서 약 95%의 신뢰구간을 의미함
lower_bound <- -1.96
upper_bound <- 1.96

# integrate 함수를 사용하여 적분
probability <- integrate(dnorm_pdf, lower_bound, upper_bound)$value

# pnorm을 사용하여 누적 확률을 계산하여 비교함
pnorm_value <- pnorm(upper_bound) - pnorm(lower_bound)

# 적분으로 계산한 확률과 pnorm으로 계산한 확률을 출력
cat("Integrate 결과 확률:", probability, "\n")
cat("Pnorm 결과 확률:", pnorm_value, "\n")

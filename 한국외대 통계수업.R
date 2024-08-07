runif(10)
runif(10)*6
table(ceiling(runif(10)*6))
roll <- table(ceiling(runif(10)*6))
table(ceiling(runif(100)*6))
roll <- table(ceiling(runif(100000)*6))
roll
barplot(roll)
dice <- (ceiling(runif(1)*6)+ceiling(runif(1)*6))/2
dice
dice <- (ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6))/6
hist(dice, breaks = 100)
dice
barplot((ceiling(runif(10)*6)+ceiling(runif(10)*6))/2)
dice <- (ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6)+ceiling(runif(1000000)*6))/6


{n <- 1000000  # 샘플의 크기
dice_rolls <- 10  # 주사위를 던지는 횟수
dice <- numeric(n)  # 결과를 저장할 빈 벡터 생성

for (i in 1:dice_rolls) {
  dice <- dice + ceiling(runif(n) * 6)
}

dice <- dice / dice_rolls  # 전체 합을 주사위 던진 횟수로 나누어 평균을 계산
hist(dice, breaks = 100)


# 먼저 필요한 변수를 설정
n <- 1000000  # 샘플의 크기
dice_rolls <- 10  # 주사위를 던지는 횟수
dice <- numeric(n)  # 결과를 저장할 빈 벡터 생성

# 주사위 던지기 시뮬레이션
for (i in 1:dice_rolls) {
  dice <- dice + ceiling(runif(n) * 6)
}
dice <- dice / dice_rolls  # 전체 합을 주사위 던진 횟수로 나누어 평균을 계산

# 평균값의 빈도수 계산
dice_counts <- table(round(dice, 1))  # 평균값을 소수 첫째 자리로 반올림하고 테이블로 빈도수 계산

# 막대 그래프 그리기
barplot(dice_counts, main="Frequency of Average Dice Rolls", xlab="Average Roll", ylab="Frequency", col="blue")

set.seed(1234)
demand <- sample(1:20, 60, replace=T)
sample
demand
mean(demand)
hist(demand)
hist(demand, breaks= 20)

y <- NULL
y <- sapply(1:100000,function(i)mean(sample(demand, 50, replace=T)))
y
hist(y, breaks = 10000)

# demand 벡터 생성
demand <- sample(1:20, 60, replace=TRUE)

# 표본 평균을 저장할 벡터 초기화
sample_means <- numeric(1000000)  # 예를 들어, 1000개의 표본 평균을 계산

# 1000번 반복하여 무작위로 2개를 추출하고 평균 계산
for (i in 1:1000000) {
  sample_data <- sample(demand, 50, replace = T)  # demand에서 2개를 무작위로 추출
  sample_means[i] <- mean(sample_data)  # 추출된 데이터의 평균을 계산
}

# 결과적으로 sample_means 벡터에는 1000개의 표본 평균이 저장됩니다.
# 이를 이용하여 분석을 진행할 수 있습니다.

# 표본 평균의 분포를 시각화
hist(sample_means, breaks= 300, main="Distribution of Sample Means", xlab="Sample Mean", col="lightblue")
}     
     
     
     
# 필요한 패키지 설치
install.packages("PortfolioAnalytics")
install.packages("quantmod")
install.packages("PerformanceAnalytics")
install.packages("DEoptim")

# 라이브러리 로드
library(PortfolioAnalytics)
library(quantmod)
library(PerformanceAnalytics)
library(DEoptim)

# 주식 데이터 다운로드
tickers <- c("AAPL", "MSFT", "GOOG")

# 주식 데이터를 가져와서 리스트로 저장
stock_data <- lapply(tickers, function(x) {
  getSymbols(x, from = "2020-01-01", to = Sys.Date(), auto.assign = FALSE)
})

# Adjusted Close만 선택하여 리스트에 저장
stock_close <- lapply(stock_data, function(x) {
  Cl(x)
})

# 리스트를 하나의 데이터프레임으로 합치기
data <- do.call(merge, stock_close)

# 수익률 계산
returns <- na.omit(Return.calculate(data))

# 데이터 검증
if (any(is.na(returns), na.rm = TRUE) || any(is.infinite(returns), na.rm = TRUE)) {
  stop("Returns contain NA or infinite values. Please check data quality.")
}

# 포트폴리오 객체 생성
portfolio <- portfolio.spec(assets = colnames(returns))
portfolio <- add.constraint(portfolio, type = "full_investment")
portfolio <- add.constraint(portfolio, type = "box", min = 0.01, max = 0.99)

# 초기 포트폴리오 비중 설정
init_weights <- rep(1/length(tickers), length(tickers))

# 최적화 수행
opt <- optimize.portfolio(returns, portfolio, optimize_method = "DEoptim", constraints = NULL, trace = TRUE, initial_weights = init_weights)

# Efficient Frontier 계산
efficient_frontier <- portfolioFrontierEstimation(data = returns, constraints = portfolio, estimation_method = "random", method_args = list(maxRet = 0.01))

# 효율적인 효과 시각화
chart.EfficientFrontier(efficient_frontier)

a <-  qnorm(0.975)  
b <-  qnorm(0.025)
a
b
c <- pnorm(a) - pnorm(b)
c
help(qnorm)

{g<- dnorm(1.5, 0 ,1)
g
library(ggplot2)

# 정규 분포의 확률 밀도 함수를 시각화
ggplot(data.frame(x = c(-3, 3)), aes(x = x)) +
  stat_function(fun = dnorm, args = list(mean = 0, sd = 1)) +
  geom_vline(xintercept = 1.5, linetype = "dashed") +  # x = 1.5에서 수직선 추가
  annotate("text", x = 1.5, y = 0.2, label = "x = 1.5", color = "blue") +  # x = 1.5에 레이블 추가
  labs(title = "Standard Normal Distribution", x = "Value (x)", y = "Density") +  # 그래프 제목 및 축 레이블 지정
  theme_minimal()  # 기본 테마 적용
}

dt(0,29)


d <- qt(0.975, 29)
e <- qt(0.025, 29)
d
e
f <- pt(d,29) - pt(e,29)
f

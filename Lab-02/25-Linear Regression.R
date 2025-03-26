# thay đổi ngôn ngữ sang enlish
Sys.setlocale("LC_ALL", "English")
Sys.setenv(LANGUAGE="en")

# xây dựng linear regression model
summary(longley)

# Tom tat
str(longley)

# ma trận tương quan giữa các biến
cor(longley)

cor(longley$GNP, longley$Employed)
# xây model
model <-lm(GNP~Employed, data =longley)
model

model$coefficients
model$coefficients[[1]]
model$coefficients[[2]]
#Data Frame
model$model

# xay model 2 bien
model1 <- lm(GNP~Employed+Armed.Forces, data=longley)
summary(model1)

model1$coefficients
model1$coefficients[[1]]
model1$coefficients[[2]]

# =============================

library(MASS)
data(Boston)

str(Boston)

summary(Boston)

# vẽ ma trận tương quan
pairs(Boston)

# tính ma trận tương quan
correlation <-cor(Boston)
print(correlation["medv",])

# plot biểu đồ phân tán giữa số phòng trung và giá trị
plot(Boston$rm, Boston$medv,
     xlab = "số phòng trung bình (rm)",
     ylab = "giá nha trung bình medv",
     main="mối quan hệ giữa rm và nedv",
     abline(lm(medv~rm, data = Boston), col="red"))



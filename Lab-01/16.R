# thông số mô hình trong R

# thiết lập môi trường
Sys.setlocale("LC_ALL", "en_US.UTF-8")
Sys.setenv(LANGUAGE = "en")

# 3 Thống kê cơ bản
# 3.1 Các hàm thống ke trong R

# sử dụng dữ liệu airquality có sẵn trong R
data(airquality)

# hiển thị một số dòng đầu tiên
head(airquality)

# xem cấu trúc dữ liệu
str(airquality)

# xem thông tin tổng quát
summary(airquality)

# tìm ra giá trị nhỏ nhất
min_ozone <-min(airquality$Ozone, na.rm = TRUE)
min_ozone

# giá trị lớn nhất
max_ozone <-max(airquality$Ozone, na.rm = TRUE)
max_ozone

# hiển thị đồng thời giá trị lớn nhất và nhỏ nhất
range(airquality$Ozone, na.rm = TRUE)

# 3.4 tính trung bình và trung vị
# trung bình
mean_ozone <- mean(airquality$Ozone, na.rm = TRUE)
mean_ozone
# cắt bớt 1 đoạn
mean(airquality$Ozone, na.rm = TRUE, trim = 0.1)

# trung vị
median_ozone <- median(airquality$Ozone, na.rm = TRUE)
median_ozone

# 3.5 tính phân vị và khoảng tứ phân vị
# phân vị (Percentile)
# phân vị thứ k ( ký hiệu Pk) là giá trị mà dưới đó có k% số quan sát trong tập dữ liệu.
# Phân vị thứ 25 (P₂₅), còn gọi là quartile thứ nhất (Q₁), là giá trị mà 25% dữ liệu nằm bên dưới nó.
# Phân vị thứ 50 (P₅₀), chính là trung vị (median), chia dữ liệu thành hai nửa bằng nhau.
# Phân vị thứ 75 (P₇₅), còn gọi là quartile thứ ba (Q₃), là giá trị mà 75% dữ liệu nhỏ hơn hoặc bằng nó.
# khoảng tứ phân vị (IQR - Interquartile Range): là khoảng tứ phân vị thứ nhất và tứ phân vị thứ 3 
# IQR = Q3 - Q1


# phân vị 25%
Q1 <- quantile(airquality$Ozone, 0.25, na.rm = TRUE)
Q1
# phân vị 50% (Q2 - Trung vị)
Q2 <- quantile(airquality$Ozone, 0.5, na.rm = TRUE)
Q2
# phân vị 75%
Q3 <- quantile(airquality$Ozone, 0.75, na.rm = TRUE)  
Q3

#3.6 Độ lệch chuẩn và phương sai

# phương sai(Variance)
# phương sai đo lường mức độ phân tán trung bình
# công thức phương sai mẫu

# độ lệch chuẩn của Ozone
sd_ozone <- sd(airquality$Ozone, na.rm = TRUE)
sd_ozone

# phương sai của Ozone
var_ozone <- var(airquality$Ozone, na.rm = TRUE)
var_ozone

sd_ozone^2

# 3.7 tính toán tự động cho nhiều biến
lapply(airquality[,1:4], mean, na.rm=TRUE)
lapply(airquality[,1:4], sd, na.rm=TRUE)

#3.8 Sử dụng package
# cài đặt thư  : install.packages("package_name")
# sử dụng : library("package_name")
install.packages("pastecs")
library(pastecs)

# tổng hợp thống kê cho 3 cột đầu tiên
stat.desc(airquality[,1:3])

# làm tròn kết quả cho dễ đọc
round(stat.desc(airquality[,1:3]), 2)

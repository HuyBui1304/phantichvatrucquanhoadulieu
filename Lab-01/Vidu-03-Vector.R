# VECTOR(VECTOR)
# vector là một dãy dữ liệu cùng kiểu ( cùng class).
# vector là cấu trúc dữ liệu cơ bản trong R.
# Mỗi biến đơn lẻ trong R thực chất chính là một vector có độ dài

# PHOUNGW THỨC TẠO vector
# lệnh cơ bản để tạo vector là c() (combine - kết hợp)
# ngoài ra còn có các hàm hữu ích khác như:

#
# rep() (replicate - sao chép)
# seq() (sequence - tạo dãy số)
#
# Kiểu dữ liệu của vector chính là kiểu dữ liệu của các phần tử trong nó.

# sử dụng c()
v1 <- c(1,2,3,4,5)
v2 <- c("A","B","C","D","E")
class(v2)
v_mix <- c(1,"A",2,"B",3,"C")
class(v_mix)

# lưu ý
# vector luôn chứa các phần tử cùng kiểu
# Nếu trộn các kiểu, R sẽ chuyển đổi tất cả về cùng dạng
# Thường là chuyển về kiểu dữ liệu "mạnh" nhất:
# 
# logical < integer < numeric < character
v_mix <- c(1,"A",2,"B",3,"C")
class(v_mix)

# sử dụng: để tự động tạo
v3 <- c(1:10)
v3

v4 <- c(1.5:3.5)
v4 

v5 <- c(1.5:3.5)

v6 <- c(TRUE , FALSE, T, F)
v6

# sử dụng rep
v7 <- rep(1, times = 10)
v7

v8 <- rep(1:3, times = 3)
v8

v9 <- rep(1:3, each = 3)
v9

v10 <- rep(c(1,2), times = 3, each = 3)
v10

# tạo dãy số seq() - Sequence
s1 <- seq(1,5)
s1

s2<- seq(from = 10, to = 20)
s2

s3 <- seq(1,10,by = 2)
s3

s4 <- seq(5,1,by=-1)
s4

today <- as.Date(Sys.Date())
dates <- seq(today, as.Date("2030-12-31"), by ="1 day")
# về các phép toán với vector trong R
x <- c(1:4) # 1 2 3 4
y <- seq(2,8,by=2) # 2 4 6 8
# cộng
x + y
# trừ 
x - y
# nhân
x * y
# chia
x / y
# lũy thừa
x ^ y
# lưu ý: nếu 2 vector có độ dài khác nhau, R sẽ lặp lại vector ngắn hơn để bằng độ dài vector dài hơn

# INDEX trong vector
# index trong R bắt đầu từ 1!

x <- seq(1,20)
x

x[1]
x[20]

y <- seq(0,10)
y[1]
y[5]
y[-2]

index <- c(3,5,7)
y[index]

index2 <-c(3:5)
y[index2]

c(c(2:5),c(3:7),seq(0:10))

y[7:8]

y[8:2]

vectorNamed <- c("Tung", "le", "18 years old")
names(vectorNamed) <- c("Name", "Surname", "Age")
vectorNamed["Age"]
vectorNamed["Surname"]

vectorNamed[c("Surname","Age")]

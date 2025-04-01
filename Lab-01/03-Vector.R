# ➢ Vector
# ➢ Matrix
# ➢ List
# ➢ Data frame

# VECTOR (VECTƠ)
# Vector là một dãy dữ liệu cùng kiểu (cùng class).
# Vector là cấu trúc dữ liệu cơ bản trong R.
# Mỗi biến đơn lẻ trong R thực chất chính là một vector có độ dài bằng 1.

# PHƯƠNG THỨC TẠO vector
# Lệnh cơ bản để tạo vector là c() (combine - kết hợp).
# Ngoài ra còn có các hàm hữu ích khác như:
#   
#   rep() (replicate - sao chép)
#   seq() (sequence - tạo dãy số)
# 
# Kiểu dữ liệu của vector chính là kiểu dữ liệu của các phần tử trong nó.

# Sử dụng c()
v1 <- c(1,2,3,4,5)
class(v1)
v2 <- c("A", "B", "C", "D", "E")
class(v2)
v_mix <- c(1, "A", 2, "B", 3, "C")
class(v_mix)

# Lưu ý:
#   
# Vector luôn chứa các phần tử cùng kiểu
# Nếu trộn các kiểu, R sẽ chuyển đổi tất cả về cùng một kiểu
# Thường là chuyển về kiểu dữ liệu "mạnh" nhất:
#   
#   logical < integer < numeric < character
v_mix <- c(TRUE, 1, "A", 2, "B", 3, "C")
class(v_mix)

# Su dung : de tu dong tao
v3 <- c(1:10)
v3
class(v3)

v4 <- c(1.5:3.5)
v4

v5 <- c(1.5:3.5)

v6 <- c(TRUE, FALSE, T, F)
v6

# Su dung rep
v7 <- rep(1, times = 10)
v7

v8 <- rep(c(1,2), times=3)
v8 

v9 <- rep(c(1,2), each=3)
v9

v10 <- rep(c(1,2), times=3, each=3)
v10


# Tao day so seq() - Sequence
s1 <- seq(1, 5)
s1

s2 <- seq(from=10, to=20)
s2

s3 <- seq(1, 10, by =2)
s3

s4 <- seq(5, 1, by=-1)
s4

today <- as.Date(Sys.Date())
dates <- seq(today, as.Date("2030-12-31"), by="day")
dates


# Về các phép toán với vector trong R
x <- c(1:4) # 1 2 3 4
y <- seq(2,8, by =2) # 2 4 6 8

# Cộng
x+y

# Trừ
x-y

# Nhân
x*y

# Chia
x/y

# Lũy thừa
x^2


# INDEX trong vector
# Index trong R bắt đầu từ 1!

x <- seq(1, 20) 
x

x[1]
x[20]

y <- seq(0, 10)
y
y[1]
y[5]
y[-2]

index <- c(3,5,7)
y[index]

index2 <- c(3:5)
y[index2]

c(c(2:5), c(3:7), seq(0:10))


y[7:8]

y[8:2]


vectorNamed <- c("Tung", "Le", "18 years old")
names(vectorNamed) <- c("name", "surname", "age")
vectorNamed["age"]
vectorNamed["surname"]

vectorNamed[c("surname", "age")]

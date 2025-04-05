set1 <- data.frame(
  IdClient = c(1:6, 8),
  Product = c("Thịt Kho", "Thịt Kho", "Thịt Kho", "Cá Kho", "Cá Kho", "Cá Kho", "Cá Kho")
)

set2 <- data.frame(
  IdClient = c(1, 2, 5, 9),
  Region = c("TP.HCM", "TP.HCM", "TP.HCM", "Đồng Nai")
)

print(set1)
# gọp dữ liệu - các phép join
# inner join :merge

set3 <-merge(set1,set2)
set3

# outer join # gọp tất cả
set4 <-merge(x = set1, y = set2, by = "IdClient", all = TRUE)
set4

# left join ( ưu tiên bảng bên trái)
set5 <-merge(x = set1, y = set2, by = "IdClient", all.x = TRUE)
set5

# right join ( ưu tiên bảng bên phải)
set6 <-merge(x = set1, y = set2, by = "IdClient", all.y = TRUE)
set6

# chuyển vị
t(set1)

ten <- 1:10
t(ten)

# sắp xếp 

# sắp xếp chỉ số

set1[1:7, ]
set1[7:1, ]

# sắp xếp theo giá trị
sort(set1$IdClient) # sắp xếp tắng
sort(set1$IdClient, decreasing = TRUE) # sắp xếp giảm

set1[order(set1$IdClient),] # sắp xếp theo cột IdClient
set1[order(set1$Product),] # sắp xếp theo cột Product
set1[order(set1$IdClient, decreasing = TRUE),] # sắp xếp theo cột IdClient giảm dần

# Lọc dữ liệu / filter
set1[2,]
set1[2,2]
set1[,2]

set1
#lọc theo điều kiện
set1[set1$Product =="Cá Kho", ]
set1[set1$Product =="Thịt Kho", ]

set1[set1$Product =="Cá Kho" & set1$IdClient == 5, ]
set1[set1$Product =="Cá Kho" | set1$IdClient == 3, ]

# lấy ra dataset con
setA <- set1[set1$Product =="Cá Kho", ]
setA
setB <- subset(set1, Product == "Cá Kho")
setB

set1

# làm việc với dữ liệu phân loại factor

set4$Product <- as.factor(set4$Product)
set4$Region <- as.factor(set4$Region)

summary(set4)

set4

# xử lý dữ liệu thiếu
is.na(set4$Product)

set4[is.na(set4$Product),]
set4[is.na(set4$Region),]

# điền giá trị thiếu
set4$Region <- as.character(set4$Region)
set4[is.na(set4$Region), "Region"] <- "Việt Nam"
set4$Region <- as.factor(set4$Region)
set4

# sử dụng complete.case
setMissing <- data.frame(
  IdClient = 1:10,
  Product = c(rep("western", 2), rep(NA, 2), rep("eastern", 2), rep(NA, 2), "western", NA),
  Region = c(seq(2000, 3500, 500), NA, seq(4000, 5000, 500), NA, 6000)
)
setMissing

# lấy các dòng đầy đủ ( không có NA)
setMissing[complete.cases(setMissing),]

# lấy các dòng có ít nhất 1 NA
setMissing[!complete.cases(setMissing),]

setMissing[is.na(setMissing$Region) | is.na(setMissing$Product),]

set1 <- data.frame(
  IdClient = c(1:6, 8),
  Product = c(rep("Thit Kho", "Thịt Kho", "Thịt kho", "Cá Kho", "Cá kho", "Cá Kho", "Cá Kho"))
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
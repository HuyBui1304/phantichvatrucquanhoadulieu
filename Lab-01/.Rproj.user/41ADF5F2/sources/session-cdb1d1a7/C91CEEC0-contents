# DATAFRAME TRONG R
# Dataframe là cấu trúc dữ liệu dùng để lưu trữ dữ liệu 
# dạng bảng trong R (phổ biến nhất cho phân tích thống kê 
# và machine learning). Dataframe có thể được xem 
# là một danh sách  các vector có cùng độ dài và thường 
# có tên duy nhất.

# 1. Tao dataframe
# Dataframe được tạo từ các vector có cùng độ dài nhưng có thể có các kiểu dữ liệu khác nhau:

column1 <- c(1:3)
column2 <- c("Tung", "Tom", "Anna")
column3 <- c(T, T, F)

dataset1 <- data.frame(column1, column2, column3)
dataset1

# Tên của các cột
colnames(dataset1)
# Đổi tên cột 2
colnames(dataset1)[2] <- "name"
dataset1

# Đổi tên nhiều cột
colnames(dataset1)<- c("#", "name", "check")
dataset1


# 2. Thêm một dòng mới
newRow <- c(4, "Duong Domic", T)
dataset2 <- rbind(dataset1, newRow)
dataset2

newRowDF <- data.frame(5, "Lisa", F)
names(newRowDF) <- c("#", "name", "check")
dataset3 <- rbind(dataset2, newRowDF)
dataset3

# 3. Thêm cột mới
newColumn <- c("a", "b", "c")
dataset4 <- cbind(dataset1, newColumn)
dataset4

dataset4$newColumn2 <- c(1,2,3)
dataset4

# 4. Truy xuất dữ liệu
# Truy xuất bằng chỉ số
dataset4[3,2] # dòng 3, cột 2

# Truy xuất bằng chỉ số và tên
dataset4[2, "check"]

# Truy xuất bằng tên cột
dataset4["name"]
dataset4[, "name"]
dataset4$name


# 5. Một số hàm cần nhớ
# Các hàm hữu ích để kiểm tra dữ liệu:
# head(): hiển thị vài dòng đầu
# tail(): hiển thị vài dòng cuối
# str(): hiển thị cấu trúc dữ liệu
# summary(): tóm tắt thống kê
head(dataset4)
tail(dataset4)
str(dataset4)
summary(dataset4)

# 6. Thay đổi kiểu dữ liệu của cột
class(dataset4$check)
dataset4$check <-  as.integer(dataset4$check)
dataset4


# 7. Build-in data frames
data() # lay ra toan bo dataset được build R
iris
View(iris)



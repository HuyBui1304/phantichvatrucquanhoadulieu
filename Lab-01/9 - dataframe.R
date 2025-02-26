# DAtaframe là cấu trúc lưu trữ ở dạng bảng 


# tạo dataframe
column1 <- c(1:3)
column2 <- c('tung','tom', 'anna')
column3 <- c(T,T,F)

dataset1 <- data.frame(column1, column2, column3)
dataset1

# tên của các cột
colnames(dataset1)

# đổi tên côt số 2
colnames(dataset1)[2] <- 'name'
dataset1

# đổi tên nhiều cột
colnames(dataset1) <- c("#", "name", "check")
dataset1

# 2. thêm một dòng mới 
newRow  <- c(4, 'dương domic', T)
dataset2 <- rbind(dataset1, newRow)
dataset2

newRowDF <- data.frame(5, 'lisa', F)
names(newRowDF) <- c("#", "name", "check")
dataset3 <- rbind(dataset2, newRowDF)
dataset3

# thêm cột mới
newColumn <- c('a', 'b', 'c')
dataset4 <- cbind(dataset1, newColumn)
dataset4

# sử dụng giấu $ để thêm cột mới
dataset4$newColumn2 <- c(1,2,3)
dataset4

# 4. truy xuất dữ liệu 
# truy xuất bằng chỉ số

dataset4[3,2] # dòng 3 cột 2

#truy xuất bằng chỉ số và tên
dataset4[2,'check']

# truy xuất bằng tên cột
dataset4['name']
dataset4[,'name']
dataset4$name

#5. một số hàm cần nhớ
# các hàm hữu ích để kiểm tra dữ liệu 
# head(): hiển thị vài dòng đầu
# tail(): hiển thị vài dòng cuối
# str(): hiển thị cấu trúc dữ liệu
# sumary(): tóm tắt thống kê

head(dataset4)
tail(dataset4)
str(dataset4)
summary(dataset4)

# 6. thay đổi kiểu dữ liệu của cột
class(dataset4$check)
dataset4$check <- as.integer(dataset4$check)
dataset4

#7. build - in data frames
data()  # lấy toàn bộ dataset được build sẵn trên R 
iris
View(iris)
CO2
head(iris)
tail(iris)
summary(iris)

# Nhiệm vụ
# 1. Tạo và thêm tên duy nhất vào năm vector có độ dài 8. Làm cho các kiểu dữ liệu của chúng đa dạng. Tạo một dataframe có tên "mySet1" từ các vector đã tạo.
vector1 = c(1:8)
vector2 = c("a", "b", "c", "d", "e", "f", "g", "h")
vector3 = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)
vector4 = c(1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8)
vector5 = as.factor(c("Thấp", "Cao", "Trung bình", "Thấp", "Cao", "Trung bình", "Thấp", "Cao"))

mySet1 <- data.frame(vector1,vector2,vector3,vector4,vector5)
mySet1


# a) Hiển thị dòng thứ 5 của dataframe đã tạo.
head(mySet1)
# b) Thay đổi tên của cột thứ hai của dataframe mySet1 thành "column02"
mySet1$col2 <- "column02" 
# c) Hiển thị 7 dòng đầu tiên của dataframe mySet1. Sử dụng hai phương pháp khác nhau - với chỉ số và với một hàm.
# với hàm
head(mySet1, 7)
# với chỉ số
mySet1[1:7,]

# 2. Sử dụng bộ dữ liệu iris. Sử dụng chỉ số để hiển thị giá trị của mỗi dòng thứ 3 giữa quan sát thứ 40 và 120. Cố gắng sử dụng một dòng lệnh duy nhất (rút gọn mã để nó vừa trong một dòng duy nhất, không có bất kỳ bước trung gian nào).
iris
iris[seq(40,120,3),] # bước nhảy là 3

# 3. Sử dụng bộ dữ liệu có sẵn "women".
women
View(women)
# a) Thay đổi kiểu của cột đầu tiên thành kiểu ký tự.
women$height <- as.character(women$height)
str(women)

# b) Thêm hai dòng mới vào bộ dữ liệu với các số tự tạo. Đảm bảo rằng bạn không làm mất các kiểu của biến trong dataframe chính trong quá trình này.
new_rows <- data.frame(
  height = as.character(c(78, 71)),
  weight = c(165,168)
)

women <- rbind(women, new_rows)
women
length(women$height)
# c) Thêm biến mới vào bộ dữ liệu và đặt tên là "shoe_size". Sử dụng hàm runif để tạo các giá trị cho biến này. Kích thước giày phải là số nguyên giữa 35 và 42.
women$shoe_size <- runif(17, min = 35, max = 42)
women

### Các bài tập ######################################################################
# 1. Đọc mô tả dữ liệu phân tích tính cách khách hàng và tải 
# vào R (file clients.csv) với tên biến là "clients".

clients <- read.csv('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/clients.csv')
head(clients)
str(clients)
# 2. Xem qua cấu trúc dữ liệu và kiểm tra các lớp (classes) đã được gán 
# cho các biến trong bộ dữ liệu.
summary(clients)
class(clients)
sapply(clients, class)


# 3. Kiểm tra xem có giá trị nào bị thiếu trong bộ dữ liệu không.
# a) Những biến nào có chứa giá trị bị thiếu?
# b) Điền các giá trị bị thiếu bằng giá trị trung bình hoặc trung vị của biến đó.
# Trước khi điền, hãy xem xét bản chất của biến. Nếu là số nguyên (ví dụ: năm sinh),
# thì hãy điền giá trị phù hợp với bản chất của biến (chúng ta không muốn năm sinh là 1995.832, phải không? ;)).
# c) Bạn sử dụng đoạn mã nào để điền các giá trị bị thiếu của Year_Birth (nếu có)?

missing_value <- clients[!complete.cases(clients),]
length(missing_value)
colSums(is.na(clients))

mean(clients$MntWines, na.rm = TRUE)
clients$MntWines[is.na(clients$MntWines)] <- mean(clients$MntWines, na.rm = TRUE)
clients$MntWines[is.na(clients$MntWines)]

median(clients$Year_Birth, na.rm = TRUE)
clients$Year_Birth[is.na(clients$Year_Birth)] <- median(clients$Year_Birth, na.rm = TRUE)
clients$Year_Birth[is.na(clients$Year_Birth)]

median(clients$Response, na.rm = TRUE)
clients$Response[is.na(clients$Response)] <- median(clients$Response, na.rm = TRUE)
clients$Response[is.na(clients$Response)]

# kiểm tra lại dữ liệu thiếu
missing_value <- clients[!complete.cases(clients),]
missing_value

sum(is.na(clients))


# 4. a) Kiểm tra xem tất cả các giá trị bị thiếu đã được điền đầy đủ chưa. Nếu chưa, lặp lại bước 3.
missing_value <- clients[!complete.cases(clients),]
missing_value

sum(is.na(clients))
# b) Bạn sẽ dùng đoạn mã nào để hiển thị tất cả các dòng vẫn còn chứa dữ liệu bị thiếu?
colSums(is.na(clients))
# 5. a) Xem xét những biến nào nên chuyển đổi thành kiểu "factor"?
str(clients)
# đếm số lượng giá trị duy nhất của từng biến
sapply(clients, function(x) length(unique(x)))
# các biến nên chuyển đổi
# "Education", "Marital_Status", , "Kidhome", "Teenhome",  
# "AcceptedCmp3", "AcceptedCmp4", "AcceptedCmp5", 
# "AcceptedCmp1", "AcceptedCmp2", "Complain", "Response"
factor_vars <- c("Education", "Marital_Status", "Kidhome", "Teenhome", 
                 "AcceptedCmp3", "AcceptedCmp4", "AcceptedCmp5", 
                 "AcceptedCmp1", "AcceptedCmp2", "Complain", "Response")
clients[factor_vars] <- lapply(clients[factor_vars], as.factor)
# Gợi ý: Đây thường là các biến văn bản có một số giá trị cụ thể và lặp lại.
# Chúng cũng có thể là các biến được biểu diễn bằng số nhưng không mang "ý nghĩa số học"
# - ví dụ: biến "education" với các giá trị 2, 3, 4 thực chất đại diện cho các cấp độ
# giáo dục liên tiếp (ý nghĩa logic) thay vì số năm học tập chính xác (ý nghĩa số học).
# b) Bạn sẽ dùng đoạn mã ngắn nhất nào để chuyển đổi biến Marital_Status?
clients$Marital_Status <- as.factor(clients$Marital_Status)
str(clients)
# 6. a) Xem xét biến nào trong số các biến đã xác định ở trên nên được
# chuyển đổi thành kiểu 'ordered factor' (biến phân loại có thứ tự).
# Gợi ý: Biến kiểu 'ordered factor' nên chứa các mức có thứ tự logic
# - ví dụ: biến 'education' với các giá trị 'primary', 'secondary'
# và 'tertiary'. Trong trường hợp này, việc giữ thứ tự các mức là quan trọng.
# Một ví dụ điển hình khác của biến ordered factor là các câu trả lời
# khảo sát sử dụng thang đo Likert (https://en.wikipedia.org/wiki/Likert_scale).
clients$Education <- factor(clients$Education, 
                            levels = c("Primary", "Secondary", "Graduation", "Master", "PhD"), 
                            ordered = TRUE)
# b) Bạn sẽ dùng đoạn mã nào để chuyển đổi biến Education? Giả sử rằng
# 2n nghĩa là giáo dục trung học và graduation tương đương với bảo vệ bằng cử nhân.
# 7. Chuyển đổi các biến đã xác định trong bước 5 và 6 thành các lớp thích hợp.
save(clients, file = "clientsInR.RData")
# 8. Lưu kết quả để tham khảo sau này! Sử dụng file RData với tên "clientsInR".
write.csv(clients, "clients_processed.csv", row.names = FALSE)


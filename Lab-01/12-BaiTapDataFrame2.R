# Sử dụng bộ dữ liệu có sẵn CO2 cho các nhiệm vụ sau:
CO2
# 1. In giá trị CO2 uptake từ lớn nhất đến nhỏ nhất.
sort(CO2$uptake, decreasing = TRUE)

# 2. Hiển thị các dòng của bộ dữ liệu CO2, nơi Type được đặt thành Quebec và Treatment thành chilled.
CO2[CO2$Type == "Quebec" & CO2$Treatment == "chilled",]
# 3. Hiển thị các dòng của bộ dữ liệu CO2, nơi uptake lớn hơn 40 và
# bộ dữ liệu được sắp xếp theo giá trị conc từ nhỏ nhất đến lớn nhất.
# Thử giải chỉ một dòng. Nếu bạn cần tạo
# một đối tượng trung gian - đặt tên là 'temp'.
temp <- CO2[order(CO2$conc), ]  # Sắp xếp CO2 theo cột 'conc'
temp[temp$uptake > 40, ]  # Lọc các hàng có giá trị 'uptake' lớn hơn 40

CO2[order(CO2$conc), ][CO2[order(CO2$conc), ]$uptake > 40, ]  # Lọc các hàng có giá trị 'uptake' lớn hơn 40]
# 4. Làm thế nào để có được một sắp xếp ngẫu nhiên của bộ dữ liệu CO2? GỢI Ý: Bạn có thể muốn có một
# vector với các chỉ số ngẫu nhiên sẽ đến từ kết quả order(unif(...)).
# set.seed(123)
# missCO2 <- CO2
# missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"uptake"] <- NA
# missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"conc"] <- NA
# missCO2$weight <- paste0(as.integer(runif(nrow(missCO2))*30),"kg")
CO2[order(runif(nrow(CO2))),]

### chạy mã này trước khi thực hiện các nhiệm vụ tiếp theo

set.seed(123)
missCO2 <- CO2
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"uptake"] <- NA
missCO2[c(as.integer(runif(10)*nrow(missCO2)),14:16),"conc"] <- NA
missCO2$weight <- paste0(as.integer(runif(nrow(missCO2))*30),"kg")
missCO2

# 5. Hiển thị các dòng của bộ dữ liệu missCO2 có ít nhất một giá trị bị thiếu.

missCO2[!complete.cases(missCO2),] # kiểm tra dữ liệu thiếu

# 6. Điền các giá trị uptake bị thiếu với giá trị 20.
missCO2[is.na(missCO2$uptake), ]$uptake <- 20
missCO2[is.na(missCO2$uptake), ]

# 7. Điền các giá trị conc bị thiếu với giá trị trung bình của conc.
mean(missCO2$conc, na.rm = TRUE) # giá trị trung bình của conc)
missCO2[is.na(missCO2$conc), "conc"] <- mean(missCO2$conc, na.rm = TRUE)
missCO2[is.na(missCO2$conc), ]


# 8. Trích xuất giá trị số từ biến weight và lưu chúng trong cột mới
# "weightNumber".


str(missCO2)

substring(missCO2$weight, 1, lenght(missCO2$weight)-2)
missCO2$weightNumber <- as.numeric(substring(missCO2$weight, 1, nchar(missCO2$weight)-2))
missCO2


# lưu DATA FRAME vào một tệp CSV
write.csv(missCO2, "missCO2.csv", row.names = TRUE)

# lưu DATA FRAME vào một tệp RDS ( định dạng R)
saveRDS(missCO2, "missCO2.rds")

# lưu nhiều đối tượng vào một tệp RDS
#save(iris, mtcars, file = "multiple_datasets.RData")







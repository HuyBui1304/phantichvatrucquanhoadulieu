# thư mục làm việt
getwd()
## cách 1
wd <- "/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-01"
setwd(wd)
path <- "data/notepadData.txt"
## cách 2
path <- "~/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/notepadData.txt"

table1 <- read.table(path, header = TRUE, sep = " ")
View(table1)

summary(table1$price)

read.table

#### other types

water <- read.csv("~/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/graphics - water quality/water_potability.csv")
View(water)
head(water)

# đọc dữ liệu từ excel
install.packages("readxl")
library(readxl)

loanEXCEL1 <- read_excel('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/dataset - loan prediction/loan_prediction_excel.xlsx')
View(loanEXCEL1)

loanEXCEL2 <- read_excel('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/dataset - loan prediction/loan_prediction_excel.xlsx', sheet = 2)
View(loanEXCEL2)

loanEXCEL3 <- read_excel('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/dataset - loan prediction/loan_prediction_excel.xlsx', sheet = 3)
View(loanEXCEL3)

class(loanEXCEL1)

loanEXCEL1 <- as.data.frame(loanEXCEL1)

remove(loanEXCEL3)

ls() # xem tất cả các đối tượng đang có trong bộ nhớ

# Lưu trữ xuống file
save(list = ls(all.names = TRUE), file="data/all.rda")

# lưu trữ 1 đối tượng
save(loanEXCEL1, file = "data/loanEXCEL1.rda")

rm(loanEXCEL1)
loanEXCEL1
load("data/loanEXCEL1.rda")
head(loanEXCEL1)







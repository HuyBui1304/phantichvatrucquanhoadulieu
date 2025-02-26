#loading data
alcohol <- read.csv('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-01/data/dataset - student alcohol consumption/student-alcohol.csv')
head(alcohol)
str(alcohol)

# lấy dữ liệu chỉ mục
head(alcohol[,-1])

alcohol <- alcohol[,-1]

str(alcohol)
summary(alcohol)

###1 missing data
missing_value <- alcohol[!complete.cases(alcohol),]
length(missing_value)

# age and Mjob
summary(alcohol$age)

median(alcohol$age, na.rm = TRUE)

# điền dữ liệu thiếu bằng trung vị

alcohol$age[is.na(alcohol$age)] <- median(alcohol$age, na.rm = TRUE)
alcohol$age[is.na(alcohol$age)]

# còn hay không
alcohol[!complete.cases(alcohol),]
length(alcohol[!complete.cases(alcohol),])
summary(alcohol)


















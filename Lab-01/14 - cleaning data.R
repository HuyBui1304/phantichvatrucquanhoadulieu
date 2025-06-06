
# Loading data
alcohol <- read.csv('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/data/dataset - student alcohol consumption/student-alcohol.csv')
head(alcohol)
str(alcohol)

# Lấy dữ liệu bằng chỉ mục
head(alcohol[,-1]) # omit the first column / loại bỏ cột số 1

alcohol <- alcohol[,-1]

str(alcohol)
summary(alcohol)


### 1. Missing data
# có hay không?
alcohol[!complete.cases(alcohol),]
length(alcohol[!complete.cases(alcohol),])

# age and Mjob
summary(alcohol$age)

median(alcohol$age)

median(alcohol$age, na.rm = TRUE)

# điền dữ liệu bằng trung vị
alcohol$age[is.na(alcohol$age)]<-median(alcohol$age, na.rm = TRUE)

alcohol$age[is.na(alcohol$age)]

# còn hay không?
alcohol[!complete.cases(alcohol),]
length(alcohol[!complete.cases(alcohol),])
summary(alcohol)

# other
alcohol$Mjob[63]<-"other"

alcohol[!complete.cases(alcohol),]


### 2. Transforming categorical data
str(alcohol)

# School
summary(factor(alcohol$school))
alcohol$school<-factor(alcohol$school, levels = c("GP", "MS"),
                       labels = c("Gabriel Pereira", "Mousinho da Silveira")
)

# Sex
summary(factor(alcohol$sex))
alcohol$sex <- factor(alcohol$sex, levels = c("F", "M"),
                      labels= c("female", "male")
)


# Sex
summary(factor(alcohol$sex))
alcohol$sex <- factor(alcohol$sex, levels = c("F", "M"), 
                      labels = c("female", "male"))




# Address
summary(factor(alcohol$address))
alcohol$address <- factor(alcohol$address, levels = c("R", "U"), 
                          labels = c("rural", "urban"))



# Family size
summary(factor(alcohol$famsize))
alcohol$famsize <- factor(alcohol$famsize, levels = c("GT3", "LE3"), 
                          labels = c("more than 3", "less or equal to 3"))



# Parent's cohabitation status
summary(factor(alcohol$Pstatus))
alcohol$Pstatus <- factor(alcohol$Pstatus, levels = c("A", "T"), 
                          labels = c("living apart", "living together"))




# Mother's education
# Pierwszy factor zapisany liczbami
summary(factor(alcohol$Medu))
alcohol$Medu <- factor(alcohol$Medu, levels = c(0, 1, 2, 3, 4), 
                       labels = c("none", "primary",
                                  "primary higher", "secondary",
                                  "higher"), ordered = TRUE)



# Father's education
summary(factor(alcohol$Fedu))
alcohol$Fedu <- factor(alcohol$Fedu, levels = c(0, 1, 2, 3, 4), 
                       labels = c("none", "primary",
                                  "primary higher", "secondary",
                                  "higher"), ordered = TRUE)



# Reason to choose this school
summary(factor(alcohol$reason))
alcohol$reason <- factor(alcohol$reason)




# Checking the structure after the first corrections
str(alcohol)
summary(alcohol)



# Guardian
summary(factor(alcohol$guardian))
alcohol$guardian <- factor(alcohol$guardian)



# Travel time
summary(alcohol$traveltime)
summary(factor(alcohol$traveltime))

#numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour

alcohol$traveltime <- factor(alcohol$traveltime, levels = c(1, 2, 3, 4), 
                             labels = c("0-15 min", "15-30 min",
                                        "30-60 min", "above 60 min"),
                             ordered = TRUE)



# Study time
summary(alcohol$studytime)
summary(factor(alcohol$studytime))

# 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours) 

alcohol$studytime <- factor(alcohol$studytime, levels = c(1, 2, 3, 4), 
                            labels = c("0-2 hours", "2-5 hours",
                                       "5-10 hours", "above 10 hours"),
                            ordered = TRUE)



# School support
summary(factor(alcohol$schoolsup))
alcohol$schoolsup <- factor(alcohol$schoolsup, levels = c("no", "yes"))

# other variables with the same structure we will try to automata
binaryVariables <- c("schoolsup", "famsup", "paid", "activities", "nursery", "higher", "internet", "romantic")

alcohol[, binaryVariables]

lapply(alcohol[, binaryVariables], summary)

lapply(alcohol[, binaryVariables], function(x) {summary(factor(x))})

alcohol$internet[alcohol$internet == 0] # tìm những thằng số 0
alcohol$internet[alcohol$internet ==0] <- "no" # gán 0 bằng no

alcohol$internet[alcohol$internet == 1] # tìm những thằng số 1
alcohol$internet[alcohol$internet == 1] <- "yes" # gán 1 bằng yes

alcohol$internet[alcohol$internet == "NO"]
alcohol$internet[alcohol$internet == "NO"] <- "no"

alcohol$internet[alcohol$internet == "YES"]
alcohol$internet[alcohol$internet == "YES"] <- "yes"

summary(factor(alcohol$internet))


# kiểm tra lại 1 lần nữa 

lapply(alcohol[, binaryVariables], function(x) {summary(factor(x))})

alcohol[,binaryVariables] <- lapply(alcohol[,binaryVariables], factor, levels= c("no", "yes"))

# tiếp tục kiểm tra các nhóm
str(alcohol)

leveledVariables <- c("freetime", "goout", "Dalc", "Walc")

lapply(alcohol[,leveledVariables], summary)



alcohol[,leveledVariables] <- lapply(alcohol[,leveledVariables], factor, 
                                     levels = c(1, 2, 3, 4, 5), 
                                     labels = c("very low", "low", "average",
                                                "high", "very high"),
                                     ordered = TRUE)

# numeric: from 1 - very bad to 5 - very good
summary(alcohol$health)
summary(factor(alcohol$health))

alcohol$health <- factor(alcohol$health, levels = c(1, 2, 3, 4, 5), 
                         labels = c("very bad", "bad", "average",
                                    "good", "very good"),
                         ordered = TRUE)

str(alcohol)


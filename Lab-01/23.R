?rgb
?min



myfunction <- function(arguments){
  #phần thân của hàm
  # ....
  return (result);
}

# Example
max(iris$Sepal.Length)
min(iris$Sepal.Length)

# manually calculating ranges
max(iris$Sepal.Length) - min(iris$Sepal.Length)

max(iris$Sepal.Width) - min(iris$Sepal.Width)

max(iris$Petal.Length) - min(iris$Petal.Length)

max(iris$Petal.Width) - min(iris$Petal.Width)

# xây dựng hàm
myRange <- function(variable){
  rangeValue <- max(variable) - min(variable);
  return(rangeValue);
}

# sử dụng hàm
myRange(iris$Sepal.Length)

# bổ sung thêm điều kiện
myRange <- function(variable, missingRemove = TRUE){
  rangeValue <- max(variable, na.rm=missingRemove) - min(variable, na.rm=missingRemove);
  return(rangeValue);
}

newwV <- c(seq(1,20,4), NA)
newwV

myRange(newwV)

myRange(newwV, F)

myRange(newwV, missingRemove = T)

# bắt lỗi dữ liệu

tryCatch(
  {
    myRange(v)
  },
  error = function(e){
    print("Error: không thể tính khoảng giá trị cho dữ liệu")
  })

# Cách sử dụng lapply
lapply(iris[,1:4], myRange);

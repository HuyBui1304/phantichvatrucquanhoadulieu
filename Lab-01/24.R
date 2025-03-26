# ví dụ về câu lệnh điều kiện

logicalVector <-c(T,F,T,T,F)
counter = 0
for (v in logicalVector){
  if(v){
    counter <- counter+1;
  }
}
counter

counter <-0;
for( i in 1: length(logicalVector)){
  if(logicalVector[i] ==T){
    counter <- counter+1;
  }
}
counter

x <- 100
if(x%%2==0){
  print(x," la so chan");
}else{  
  print(x, "la so le")
}

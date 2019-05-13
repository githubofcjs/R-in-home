pollutantmean<-function(directory, pollutant, id = 1:332)
{
  #读取数据，存入data
  fileNames <- dir(directory) 
  filePath <- sapply(fileNames, function(x){ 
    paste(directory,x,sep='/')})   
  data <- lapply(filePath[id], function(x){
    read.csv(x, header=T)})  
  #将文件中的pollutant值存入变量a中
  vector = 2:length(id)
  a<-data[[1]][pollutant]
  #if语句防止id长度只有1
  if(length(data)>1){
  for (i in vector) {
   b<- data[[i]][pollutant]
   a<-c(a,b)
  }  
  }
  #将a中的值存入向量b中，否则a为data.fram,不好读取
  b<-a[1][[1]]
  if(length(a)>1){
  for (i in vector) {
    b<-c(b,a[i][[1]])
  }
  }
  #清理NA值
  b<-b[!is.na(b)]
  #求平均
  mean_m<-mean(b)
  #输出平均值
  mean_m
}

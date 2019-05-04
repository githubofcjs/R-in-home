pollutantmean<-function(directory, pollutant, id = 1:332)
{
  fileNames <- dir(directory) 
  filePath <- sapply(fileNames, function(x){ 
    paste(directory,x,sep='/')})   
  data <- lapply(filePath[id], function(x){
    read.csv(x, header=T)})  
  vector = 2:length(id)
  a<-data[[1]][pollutant]
  if(length(data)>1){
  for (i in vector) {
   b<- data[[i]][pollutant]
   a<-c(a,b)
  }
  }
  b<-a[1][[1]]
  if(length(a)>1){
  for (i in vector) {
    b<-c(b,a[i][[1]])
  }
  }
  b<-b[!is.na(b)]
  mean_m<-mean(b)
  mean_m
}

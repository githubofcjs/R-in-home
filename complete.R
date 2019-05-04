complete<-function(directory,id = 1:332){
  fileNames <- dir(directory) 
  filePath <- sapply(fileNames, function(x){ 
    paste(directory,x,sep='/')})   
  data <- lapply(filePath[id], function(x){
    read.csv(x, header=T)})  
  vector = 1:length(id)
  my_matrix<-rep(0,times = 2*length(id))
  dim(my_matrix)<-c(length(id),2)
  for (i in vector) {
    a<-data[i][[1]]
    b<-!is.na(a[[2]])
    c<-!is.na(a[[3]])
    my_matrix[i]<-a[4][[1]][1]
    my_matrix[i+length(id)]<-sum(b&c)
  }
  my_data<-data.frame(my_matrix)
  colnames(my_data)<-c("id","nobs")
  my_data
  }


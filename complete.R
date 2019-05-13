#此函数读取所有选择的文件，并将所有含NA的行删除
complete<-function(directory,id = 1:332){
  #id决定了要读取的文件的名称和数量
  #将要读取的文件存入data变量
  fileNames <- dir(directory) 
  filePath <- sapply(fileNames, function(x){ 
    paste(directory,x,sep='/')})   
  data <- lapply(filePath[id], function(x){
    read.csv(x, header=T)})  
  
  vector = 1:length(id)
  my_matrix<-rep(0,times = 2*length(id))
  dim(my_matrix)<-c(length(id),2)
  #按顺序将文件中的id值（满足非NA）和nobs值（满足非NA）存入my_matrix
  for (i in vector) {
    a<-data[i][[1]]
    b<-!is.na(a[[2]])
    c<-!is.na(a[[3]])
    my_matrix[i]<-a[4][[1]][1]
    my_matrix[i+length(id)]<-sum(b&c)
  }
  my_data<-data.frame(my_matrix)
  #将第一列命名为id，第二列命名为nobs
  colnames(my_data)<-c("id","nobs")
  #输出my_matrix
  my_data
  }


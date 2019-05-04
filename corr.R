corr<-function(directory,threshold = 0){
  fileNames <- dir(directory) 
  filePath <- sapply(fileNames, function(x){ 
    paste(directory,x,sep='/')})   
  data <- lapply(filePath, function(x){
    read.csv(x, header=T)}) 
  a<-complete(directory)
  a<-a[2][[1]]
  a<-a>threshold
  corr_addone<-0
  for (i in 1:332) {
    if(a[i]){
    m<-data[[i]][2][[1]]
    n<-data[[i]][3][[1]]
    lgm<-!is.na(m)
    lgn<-!is.na(n)
    tr<-lgm&lgn
    corr_addone<-c(corr_addone,cor(m[tr],n[tr],method = c("pearson", "kendall", "spearman")))
    }
    
  }
  corr_all<-corr_addone[2:length(corr_addone)]
  corr_all
}
corr<-function(directory,threshold = 0){
  #读取directory文件，数据存入data
  fileNames <- dir(directory) 
  filePath <- sapply(fileNames, function(x){ 
    paste(directory,x,sep='/')})   
  data <- lapply(filePath, function(x){
    read.csv(x, header=T)}) 
  #去除含NA值的行（见complete.R）
  a<-complete(directory)
  a<-a[2][[1]]
  #去除所有小于threshold的nobs值
  a<-a>threshold
  #初始化要输出的协方差系数向量，第一个值无用，处理完后要删掉
  corr_addone<-0
  for (i in 1:332) {
    #判断第i行是否存在非空值
    if(a[i]){
      
    m<-data[[i]][2][[1]]
    n<-data[[i]][3][[1]]
    lgm<-!is.na(m)
    lgn<-!is.na(n)
      #得到所有满足data的2,3行均非空的索引值
    tr<-lgm&lgn
      #将第i个的协方差系数插入向量末尾，cor为协方差系数函数
    corr_addone<-c(corr_addone,cor(m[tr],n[tr],method = c("pearson", "kendall", "spearman")))
    }
    
  }
  #舍弃初始化系数
  corr_all<-corr_addone[2:length(corr_addone)]
  #输出协方差向量
  corr_all
}

rankall <- function(outcome, num = "best") {
  #读取文件，选择所需列存入my_data
  flags<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available",stringsAsFactors=FALSE)
  outcomes <- c("heart attack", "heart failure","pneumonia")
  my_data <-flags[c(2,7,11,17,23)]  #name,state,attack,failure,pneumia
  names(my_data)<-c('name','state','heart attack','heart failure','pneumonia')
  ## Check that state and outcome are valid
 #根据outcome操作对应的列   
    if(outcome == outcomes[1]){i<-3}
    else if(outcome == outcomes[2]){i<-4}
    else if(outcome == outcomes[3]){i<-5}
    else{stop('invalid outcome')}
    new_data<-my_data[c(1,2,i)]
      #清除含NA的样本
    new_data<-new_data[!is.na(new_data[3]),]
  #将出现的state名存入only_name中（无重复）  
  only_name<-unique(my_data[2])
    len<-length(only_name[,1])
    re1=rep(0,len)
   
  if(num == 'best'){num<-1}
    if(num == 'worst'){num<-len}
  
    for(a in 1:len){
      #根据state值进行提取
      tf<-new_data[2]==only_name[[1]][a]
      data1<-new_data[tf,]
      #重新排序
      data2<-data1[order(data1[3],data1[1]),]
      #由于排序后的行名混乱，为方便后续操作，对每行的行名按顺序重命名
      row.names(data2)<-1:dim(data2)[1]
      #根据num选择name值
      re1[a]<-data2[num,1]
      }
  #将name值与state值合并
    re<-cbind(re1,only_name)
  #根据state值重新排序
    ran<-re[order(re[,2]),]
  #重命名行和列
    colnames(ran)<-c('hospital','state')
    mn<-unlist(only_name)
    rownames(ran)<-mn[order(mn)]
  #返回得到的data.fram（一个数据框）
    ran
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}

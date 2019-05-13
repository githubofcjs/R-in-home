rankhospital <- function(state,outcome, num = "best") {
  ## Read outcome data
  #read file
  flags<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available",stringsAsFactors=FALSE)
  outcomes <- c("heart attack", "heart failure","pneumonia")
  my_data <-flags[c(2,7,11,17,23)]  #name,state,attack,failure,pneumia
  names(my_data)<-c('name','state','heart attack','heart failure','pneumonia')
  ## Check that state and outcome are valid
  if(state %in% my_data$state){
    if(outcome == outcomes[1]){i<-3}
    else if(outcome == outcomes[2]){i<-4}
    else if(outcome == outcomes[3]){i<-5}
    else{stop('invalid outcome')}
    tf1<-!is.na(my_data[i])
    tf2<-my_data[2] == state
    #选择state对应值，并清除NA值
    list_hospital<-my_data[,c(1,i)][tf1&tf2,]
    #使用order函数对所选数据进行排序
    rankhospital<-list_hospital[order(list_hospital[,2],list_hospital[,1]),]
    #重命名行名
    rownames(rankhospital)<-c('best',2:(dim(rankhospital)[1]-1),'worst')
  }
   else{stop('invalid state')}
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  #根据输入的num参数进行输出
  hospital_name<-rankhospital[num,1]
  hospital_name
}

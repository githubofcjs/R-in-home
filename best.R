best<-function(state, outcome){
  #读取csv文件，并存入flags变量
  flags<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available",stringsAsFactors=FALSE)
  outcomes <- c("heart attack", "heart failure","pneumonia")
  #提取所有样本的四个特征
  my_data <-flags[c(2,7,11,17,23)]  #name,state,attack,failure,pneumia
  names(my_data)<-c('name','state','heart attack','heart failure','pneumonia')
  #验证输入参数outcome是否在"heart attack", "heart failure","pneumonia"当中，若不是则终止参数
  #根据对应outcome选择操作的列
  if(outcome == outcomes[1]){i<-3}
  else if(outcome == outcomes[2]){i<-4}
  else if(outcome == outcomes[3]){i<-5}
  else {stop("invaild outcome")}
  #验证输入的state参数的值是否在state特征里出现
  if(state %in% my_data[['state']]){
  #对于操作列进行逻辑判断
  #判断每个值是否是非数值（NA）
  tf1<-!is.na(my_data[[i]])
   #将非NA值存入new_data
  new_data<-my_data[tf1,]
   #选择对应state值与输入state值相等的列
  tf2<-new_data$state== state
    #筛选出所有符合条件的值
  new_data1<-new_data[tf2,]
    #找到最小值（即best值）
  min_best<-min(new_data1[i])
    #找到最小值的索引
  tf<- (new_data1[i] == min_best)
    #将最小值对应的名字（字符串）存入best_hp
  best_hp<-new_data1$name[tf]
  }
  else {stop("invaild state")}
  #输出医疗条件最好（值最小）的医院名
   best_hp
}

best<-function(state, outcome){
  flags<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available",stringsAsFactors=FALSE)
  outcomes <- c("heart attack", "heart failure","pneumonia")
  my_data <-flags[c(2,7,11,17,23)]  #name,state,attack,failure,pneumia
  names(my_data)<-c('name','state','heart attack','heart failure','pneumonia')
  if(outcome == outcomes[1]){i<-3}
  else if(outcome == outcomes[2]){i<-4}
  else if(outcome == outcomes[3]){i<-5}
  else {stop("invaild outcome")}
  if(state %in% my_data[['state']]){
  tf1<-!is.na(my_data[[i]])
  new_data<-my_data[tf1,]
  tf2<-new_data$state== state
  new_data1<-new_data[tf2,]
  min_best<-min(new_data1[i])
  tf<- (new_data1[i] == min_best)
  best_hp<-new_data1$name[tf]
  }
  else {stop("invaild state")}
  best_hp
}
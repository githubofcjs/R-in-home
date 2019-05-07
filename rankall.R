rankall <- function(outcome, num = "best") {
  flags<-read.csv("outcome-of-care-measures.csv",na.strings = "Not Available",stringsAsFactors=FALSE)
  outcomes <- c("heart attack", "heart failure","pneumonia")
  my_data <-flags[c(2,7,11,17,23)]  #name,state,attack,failure,pneumia
  names(my_data)<-c('name','state','heart attack','heart failure','pneumonia')
  ## Check that state and outcome are valid
    
    if(outcome == outcomes[1]){i<-3}
    else if(outcome == outcomes[2]){i<-4}
    else if(outcome == outcomes[3]){i<-5}
    else{stop('invalid outcome')}
    new_data<-my_data[c(1,2,i)]
    new_data<-new_data[!is.na(new_data[3]),]
    only_name<-unique(my_data[2])
    len<-length(only_name[,1])
    re1=rep(0,len)
    if(num == 'best'){num<-1}
    if(num == 'worst'){num<-len}
    for(a in 1:len){
      tf<-new_data[2]==only_name[[1]][a]
      data1<-new_data[tf,]
      data2<-data1[order(data1[3],data1[1]),]
      row.names(data2)<-1:dim(data2)[1]
      re1[a]<-data2[num,1]
      }
    re<-cbind(re1,only_name)
    ran<-re[order(re[,2]),]
    colnames(ran)<-c('hospital','state')
    mn<-unlist(only_name)
    rownames(ran)<-mn[order(mn)]
    ran
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}
best<-function(state, outcome){
  flags<-read.csv("outcome-of-care-measures.csv")
  if(state %in% flags[["State"]]) 
    {if(outcome %in% c("heart attack", "heart failure","pneumonia"))
  {
  if(state == "heart attack"){
    a<-cbind(as.character(flags[["State"]]),as.numeric(flags[[11]]))
  }
  else if(state == "heart failure"){
    a<-cbind(as.character(flags[["State"]]),as.numeric(flags[[17]]))
  }
  else if(state == "pneumonia"){
    a<-cbind(as.character(flags[["State"]]),as.numeric(flags[[23]]))
  }
  b1<-a[,1] == state
  b0<-a[,2]
  state_min<-min(b0[b1])
  b2<-a[,2] == state_min
  b<-b1&b2
  c<-as.character(flags[[2]])
  hospital_name_list<-c[b]
    }
    else{stop("invaild outcome")}
    }
  else  {stop("invaild state")}
  hospital_name_list
}

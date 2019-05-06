best<-function(state, outcome){
  flags<-read.csv("outcome-of-care-measures.csv")
  if((!state %in% flags[["State"]]) & 
     +outcome %in% c("heart attacck", "heart failure","pneumonia"))
  {
    stop ("State argrument invalid, please input a valid input")
  }
  
  if(state == "heart attacck"){
    a<-as.numeric(flags[[11]])
  }
  else if(state == "heart failure"){
    a<-as.numeric(flags[[17]])
  }
  else if(state == "pneumonia"){
    a<-as.numeric(flags[[23]])
  }
  b<-which(a == min(a))
  c<-flags[[2]]
  hospital_name_list<-c[b]
  hospital_name_list
}
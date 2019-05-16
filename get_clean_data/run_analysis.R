run_analysis<-function(directory = 'UCI HAR Dataset')
{
  dr1<-paste(directory,'train','X_train.txt',sep = '/')
  X_train<-read.table(dr1)
  dr1_name<-paste(directory,'features.txt',sep = '/')
  X_train_name<-read.table(dr1_name)
  names(X_train)<-X_train_name[,2]
}
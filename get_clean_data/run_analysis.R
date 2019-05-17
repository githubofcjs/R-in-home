###before the function run, we assuming that the data file 'UCI HAR Dataset'
###was just included in the workspace directory
run_analysis<-function(directory = 'UCI HAR Dataset')
{
  #读取数据(read these data)
  dr1<-paste(directory,'train','X_train.txt',sep = '/')
  dr2<-sub('X_','y_',dr1)
  dr3<-sub('X_','subject_',dr1)
  X_train<-read.table(dr1)
  y_train<-read.table(dr2)
  subject_train<-read.table(dr3)
  X_test<-read.table(gsub('train','test',dr1))
  y_test<-read.table(gsub('train','test',dr2))
  subject_test<-read.table(gsub('train','test',dr3))
  #合并数据（merge the data）
  train_data<-cbind(X_train,y_train,subject_train)
  test_data<-cbind(X_test,y_test,subject_test)
  all_data<-rbind(train_data,test_data)
  #提取X的特征名称(get the names of the X's feature names)
  X_name<-read.table(paste(directory,'features.txt',sep = '/'))
  #赋予特征名称，同时给y与subject列命名
  #add the names of 'y' and 'subject' to the last name set
  #and use them
  names(all_data)<-c(as.character(X_name$V2),'Act','ID_ofVolunteer')
  write.table(all_data,'all_data.txt',quote = FALSE,row.name=FALSE)
}
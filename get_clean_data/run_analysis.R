###before the function run, we assuming that the data file 'UCI HAR Dataset'
###was just included in the workspace directory
run_analysis<-function(directory = 'UCI HAR Dataset')
{
  #读取数据(read these data)
  dr1<-paste(directory,'train','X_train.txt',sep = '/')
  dr2<-sub('X_','y_',dr1)
  dr3<-sub('X_','subject_',dr1)
  #修改活动标签
  actlab<-paste(directory,'activity_labels.txt',sep = '/')
  activity<-read.table(actlab)
  
  X_train<-read.table(dr1)
  y_train<-read.table(dr2)
  y_train<-data.frame(sapply(y_train, function(x){activity$V2[x]}))
  subject_train<-read.table(dr3)
  X_test<-read.table(gsub('train','test',dr1))
  y_test<-read.table(gsub('train','test',dr2))
  y_test<-data.frame(sapply(y_test, function(x){activity$V2[x]}))
  
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
  names(all_data)<-c('Act','ID_ofVolunteer',as.character(X_name$V2))
  need_data<-all_data[,index]
  tidydata<-cbind(all_data['Act','ID_ofVolunteer'],need_data)
  write.table(need_data,'tidydata.txt',quote = FALSE,row.names = FALSE)
}
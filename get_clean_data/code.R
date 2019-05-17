function(directory = 'UCI HAR Dataset')
{
  X_name<-read.table(paste(directory,'features.txt',sep = '/'))
  #全部小写
  X_name1<-tolower(as.character(X_name$V2))
  #grep the name which match the condition
  index<-grep('mean()|std()',X_name1)
  X_name1<-X_name1[index]
  X_name2<- sub('mag',' whose magnitude wss calculated using the Euclidean  norm',X_name1)
  X_name3<- sub('jerk',' derived in time to obtain Jerk signals',X_name2)
  X_name4<-sub('acc',' acceleration',X_name3)
  X_name5<-sub('gyro',' gravity',X_name4)
  X_name6<-sub('^t','The ',X_name5)
  #name explain 解释
  a<-'mean\\(\\): Mean value
  std(): Standard deviation
  meanFreq\\(\\): Weighted average of the frequency components to obtain a mean frequency
  angle(): Angle between two vectors
  -x: -in the x-axis direction
  -y: -in the y-axis direction
  -z: -in the z-axis direction'
  
  b<-unlist(strsplit(a,split = '\n'))
  c<-sapply(b, function(x){strsplit(x,split = ':')})
  d<-list(rep('0',length(c)+1))
  d[[1]]<-X_name6
  for (i in 2:(length(c)+1))
  {
    d[[i]]<-sub(c[[i-1]][1],c[[i-1]][2],d[[i-1]])
  }
  description<-d[[length(d)]]
  description<-sub('\\(\\)','',description)
  description<-sub('\\)','',description)
  description<-sub('\\(',' ',description)
  description<-sub('\\.','',description)
  description<-sub('^f','The (after Fast Fourier Transform)',description)
  #其他手动修改（revise others by hand）
  code_book<-paste(X_name$V2[index],description,sep = ': ')
  rbind(code_book,'ACT: activity labels','ID_ofVolunteer: the number of the volunteer')
  write.table(code_book, 'code_book.md',row.names = FALSE,col.names = FALSE,quote = FALSE)
}
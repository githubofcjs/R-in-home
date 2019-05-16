  directory <- 'UCI HAR Dataset'
  X_name<-read.table(paste(directory,'features.txt',sep = '/'))
  #全部小写
  X_name1<-tolower(as.character(X_name$V2))
  X_name2<- sub('mag',' whose magnitude wss calculated using the Euclidean  norm',X_name1)
  X_name3<- sub('jerk',' derived in time to obtain Jerk signals',X_name2)
  X_name4<-sub('acc',' acceleration',X_name3)
  X_name5<-sub('gyro',' gravity',X_name4)
  X_name6<-sub('^t','The ',X_name5)
  X_name7<-sub('^f','The (after Fast Fourier Transform)',X_name6)
  mean(): Mean value
  n8<-sub('mean()','Mean value',X_name7)
  n9<-sub('std()','Standard deviation',n8)
mad(): Median absolute deviation 
n9<-sub('mad()','Standard deviation',n8)
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
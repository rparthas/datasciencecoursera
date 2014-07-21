library('data.table')
library('reshape2')

setAxis <- function(cast,column,vals,values){
  result <- 'NA'
  for(i in 1:length(vals)){
    if(grepl(vals[i],column,perl=T)){
      result <-values[i]
    }
  }
  cast$name <- result
  cast
}

#Adds descriptive Activity coloumn for each data
addActivity <- function(dataSet,activitySet,peopleSet) {
  activities <- read.table('activity_labels.txt')
  activitySet <- merge(activities,activitySet,all=F)
  colnames(activitySet) <- c('id','Activity')
  colnames(peopleSet) <- c('Person')	
  dataSet$Activity <- as.vector(activitySet[2])
  dataSet$Person <- peopleSet
  dataSet
}

#filters just mean and standard deviation rows from the dataset
filterMeanAndStd <- function(dataSet){
  means <- grepl('mean',tolower(colnames(dataSet)),perl=T) 
  std <- grepl('std',tolower(colnames(dataSet)))
  dataSet <- cbind(dataSet[,means],dataSet[,std])
  dataSet <- dataSet[,!grepl('angle',tolower(colnames(dataSet)))]
  dataSet <- dataSet[,!grepl('meanfreq',tolower(colnames(dataSet)))]
  #dataSet <- dataSet[,grepl('[xyz]$',tolower(colnames(dataSet)),perl=T)]
  dataSet
}

#creates a tidy dataset
tidify <-function(dataSet){
  tidy <- as.data.frame(setNames(replicate(9,numeric(0), simplify = F), c('Person','Activity','Average','Axis','Domain',
                                                                          'Feature','Jerk/Magnitude','Device','Mean/Std')))
  columns <- colnames(dataSet)
  for( i in 1: (length(columns)-2) ){
    column <- columns[i]
    subsetData <- subset(dataSet,select=c('Person','Activity',column))
    subsetData[,1] <- unlist(subsetData[,1])
    subsetData[,2] <- unlist(subsetData[,2])
    molten <- melt(subsetData,id.vars=c('Person','Activity'),measure.vars=column,variable.name='Measure',value.name='Mean')
    cast <- dcast(molten,Person+Activity ~ Measure,fun.aggregate=mean,value.var='Mean')
    colnames(cast)[3] ='Average'
    cast <- setAxis(cast,column,c('-X','-Y','-Z'),c('X','Y','Z'))    
    colnames(cast)[length(colnames(cast))] <- 'Axis'
    cast <- setAxis(cast,column,c('^f','^t'),c('Frequency','Time'))    
    colnames(cast)[length(colnames(cast))] <- 'Domain'
    cast <- setAxis(cast,column,c('Body','Gravity'),c('Body','Gravity'))    
    colnames(cast)[length(colnames(cast))] <- 'Feature'
    cast <- setAxis(cast,column,c('Jerk','Magnitude'),c('Jerk','Magnitude'))    
    colnames(cast)[length(colnames(cast))] <- 'Jerk/Magnitude'
    cast <- setAxis(cast,column,c('Acc','Gyro'),c('Accelerometer','Gyroscope'))    
    colnames(cast)[length(colnames(cast))] <- 'Device'
    cast <- setAxis(cast,column,c('mean','std'),c('Mean','Standard Deviation'))    
    colnames(cast)[length(colnames(cast))] <- 'Mean/Std' 
    tidy <- rbind(tidy,cast)
  }
  tidy <- tidy[c(1,2,4,5,6,7,8,9,3)]
  tidy[order(tidy$Person,tidy$Activity),]
}

#Read training,test data and activity samples
train <- read.table('train/X_train.txt')
test <- read.table('test/X_test.txt')
features <- read.table('features.txt')
trainActivity <- read.table('train/y_train.txt')
testActivity <- read.table('test/y_test.txt')
trainPeople <- read.table('train/subject_train.txt')
testPeople <- read.table('test/subject_test.txt')
activitySet <- rbind(trainActivity,testActivity)
peopleSet <- rbind(trainPeople,testPeople)

#Merge the data and set col headers
dataSet <- rbind(train,test)
colnames(dataSet) <- t(features[2])

#Filter the data , Add descriptive Activity and tidy the data writing out the result
dataSet <- filterMeanAndStd(dataSet)
dataSet <- addActivity(dataSet,activitySet,peopleSet)
tidy <- tidify(dataSet)
write.table(tidy,file='tidy.txt',row.names=F,col.names=T)

complete <-function(directory, id = 1:332) {
  result <- data.frame(id=numeric(0),nobs=character(0))
  for (ids in id){
    file <- "csv"
    if(ids < 10){
      file <- paste(paste("00",ids,sep=""),file,sep=".")
    }else{
      if(ids < 100){
        file <- paste(paste("0",ids,sep=""),file,sep=".")
      }else{
        file <- paste(ids,file,sep=".")
      }
    }
    fname <- paste(directory,file,sep="/")  
    dataset <- read.csv(fname, header=TRUE)
    dataset <- dataset[complete.cases(dataset),] 
    dataset <- nrow(dataset)
    result <- rbind(result,c(ids,dataset)) 
  }
  names(result) <- c('id','nobs')
  result
}


pollutantmean <-function(directory, pollutant, id = 1:332) {
  total <- 0
  cnt <- 0
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
    dataset <- dataset[!(is.na(dataset[pollutant])),] 
    total <- total +  sum(dataset[[pollutant]]) 
    cnt <- cnt +  nrow(dataset) 
    #print(total)
    #print(cnt)
  }
  round(total/cnt,digits=3)
}



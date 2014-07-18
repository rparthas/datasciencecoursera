corr <- function(directory, threshold = 0) {
  result <- numeric()
  for(file in list.files(directory)){
    fname <- paste(directory,file,sep="/")
    dataset <- read.csv(fname, header=TRUE)
    dataset <- dataset[complete.cases(dataset),] 
    if(nrow(dataset) > threshold){
      result <-append(result, cor(dataset$sulfate,dataset$nitrate))
    }
  }
  result
}

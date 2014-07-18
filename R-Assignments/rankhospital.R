rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcomeCsv <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  index <- -1
  if(outcome == 'heart attack'){
    index <- 11
  }else if(outcome == 'heart failure'){
    index <- 17
  }else if(outcome == 'pneumonia'){
    index <- 23
  }else{
    stop('invalid outcome')
  }    
  outcomeCsv <- outcomeCsv[outcomeCsv[7] == state,]
  len <- length(as.numeric(outcomeCsv[,index]))
  if(len <= 0){
    stop('invalid state')
  }
  outcomeCsv <- outcomeCsv[,c(2,index)]
  colnames(outcomeCsv) <- c('name','mortality')
  outcomeCsv <- outcomeCsv[order(as.numeric(outcomeCsv$mortality),outcomeCsv$name,na.last=NA),]
  if(num == 'best'){
   head(outcomeCsv,1)$name
  }else if(num == 'worst'){
    tail(outcomeCsv,1)$name
  }else{
   outcomeCsv[num,]$name
  }
}
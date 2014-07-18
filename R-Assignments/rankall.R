rankall <- function(outcome, num = "best") {
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
  
  states <- split(outcomeCsv,outcomeCsv$State)
  states <- sapply(states,function(state){
    state <- state[order(as.numeric(state[,index]),state[,2],na.last=NA),]
    if(num == 'best'){
      result <- head(state,1)[c(2,7)]
    }else if(num == 'worst'){
      result <- tail(state,1)[c(2,7)]
    }else{
      result <- state[num,c(2,7)]
    } 
    if(is.na(result)){
      result <- c(NA,state[1,7])
    }
    result
  })
  states <- t(states)
  colnames(states) <- c('hospital' ,'state')
  data.frame(states)
}
 

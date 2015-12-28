complete <- function(directory, id = a:b) {
  setwd(directory)  
  q <- list.files (getwd())
  l <- length(q)
  dat <- data.frame()
  if(l != "") {
    for (i in id){
      con <- file (q[i], "r")
      mydata <- read.csv(q[i], header=TRUE)
      nobs <- sum(complete.cases(mydata))
      temp <- data.frame(i, nobs)
      dat <- rbind(dat, temp)
      close (con) 
    }
    colnames(dat) <- c("id", "nobs")
  }
  return (dat)
}



pollutantmean <- function(directory, pollutant, id = 1:332) {

  q <- list.files(directory, full.names = TRUE) 
  
  dat <- data.frame()
  
  for (i in id) {
    dat <- rbind(dat, read.csv(q[i]))
  }
  
  mean(dat[, pollutant], na.rm = TRUE)
}


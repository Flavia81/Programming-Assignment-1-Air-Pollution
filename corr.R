corr <- function(directory, threshold = 0) {
  q <- list.files(directory, full.names = TRUE)
  dat <- vector(mode = "numeric", length = 0)
  
  for (i in 1:length(q)) {
    s <- read.csv(q[i])
    tot <- sum((!is.na(s$sulfate)) & (!is.na(s$nitrate)))
    if (tot > threshold) {
      temp <- s[which(!is.na(s$sulfate)), ]
      sub <- temp[which(!is.na(temp$nitrate)), ]
      dat <- c(dat, cor(sub$sulfate, sub$nitrate))
    }
  }
  
  dat
}
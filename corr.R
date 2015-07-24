corr <- function(directory, threshold = 0) {

  monitorlist <- list.files(path = directory, pattern = "*.csv", full.names = TRUE) # This is a list of all .csv
  
  correlation <- vector(mode = "numeric", length = 0)
  
  for(i in 1:length(monitorlist)) {
    
    data <- read.csv(monitorlist[i])
    complete <- complete.cases(data)
    good <- data[complete, ]
    nobs <- nrow(data[complete, ])
    
    if(nobs > threshold) {
      
      monitordata <- cor(good[["sulfate"]], good[["nitrate"]])
      correlation <- c(correlation, monitordata)
      
    }
    
  }
 
  print(correlation)
       
}
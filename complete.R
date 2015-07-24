complete <- function(directory, id = 1:332) {
  
  ## I first create the needed objects
  monitorlist <- list.files(path = directory, pattern = "*.csv", full.names = TRUE) # This is a list of all .csv
  selection <- monitorlist[id] # This object contains the selection of files, specified in "ID"
  
  idlist <- vector()
  nobslist <- vector()
    
  ## I create a loop that loads the files in data and extracts the selected results  
  for(i in 1:length(selection)) {
    data <- read.csv(selection[i]) # read the selected files
    complete <- complete.cases(data)
    nobs <- nrow(data[complete, ])
    monitorid <- data[1, 4]
    idlist <- c(idlist, monitorid)
    nobslist <- c(nobslist, nobs)
    #resultlist <- c(resultlist, data[[pollutant]]) # add the selected results to the vector
  }
  
  resultlist <- as.data.frame(cbind(idlist, nobslist), ncol = 2) # This creates an empty vector that later has all the data in it
  colnames(resultlist) <- list("id", "nobs")
  print(resultlist)
}
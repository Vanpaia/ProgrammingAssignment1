pollutantmean <- function(directory, pollutant, id = 1:332, removeNA = TRUE) {
  
  ## I first create the needed objects
  monitorlist <- list.files(path = directory, pattern = "*.csv", full.names = TRUE) # This is a list of all .csv
  resultlist <- vector() # This creates an empty vector that later has all the data in it
  selection <- monitorlist[id] # This object contains the selection of files, specified in "ID"

  ## I create a loop that loads the files in data and extracts the selected results  
  for(i in 1:length(selection)) {
    data <- read.csv(selection[i]) # read the selected files
    resultlist <- c(resultlist, data[[pollutant]]) # add the selected results to the vector
  }
  
  ## I take the mean of all the results and print it
  result <- mean(resultlist, na.rm = removeNA)
  print(result)
  
}
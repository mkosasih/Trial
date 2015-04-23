complete <- function(directory, idd = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  mydir <- paste0("C:/Users/Marlina/Desktop/Rclass","/",directory)
  files <- list.files(mydir)
  setwd(mydir)
  
  id <- NULL
  nobs <- NULL
  
  
  for (i in idd){
    data <- read.csv(files[i])
    len <- length(data[,1])
    cleaner <- complete.cases(data)
    cleandata <- data[cleaner,]
    
    #count2 <- length(which(!is.na(cleandata[,2])))
    #count3 <- length(which(!is.na(cleandata[,3])))
    
    #count <- min(count2, count3)
    count <- length(cleandata[,1])
    id <- append(id, i)
    nobs <- append(nobs, count)
    
  }
setwd("C:/Users/Marlina/Desktop/Rclass")
ans <- as.data.frame(cbind(id, nobs))
colnames(ans) <- c("id","nobs")
ans

}

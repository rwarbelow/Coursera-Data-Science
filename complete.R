complete <- function(directory, id = 1:332) {
  result <- data.frame( "id" = numeric(), "nobs" = numeric(), stringsAsFactors=FALSE)
  correctedfilenumbers <- str_pad(id, 3, pad = 0)

  for(i in correctedfilenumbers) {
    idforsave <- as.integer(i) 
    filename <- paste(directory, '/', i, '.csv', sep = "")
    csvresult <- read.csv(filename)
    mydata <- data.frame(csvresult)
    okvalues <- complete.cases(mydata)
    cleanrows <- NROW(na.omit(mydata))
    result[nrow(result) + 1, ] <- c( idforsave, cleanrows)
  }
  result
}
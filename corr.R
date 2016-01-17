corr <- function(directory, threshold = 0) {
  completedata <- complete(directory) 
  results <- numeric()
  meetsthreshold <- completedata[completedata$nobs >= threshold,]
  ids <- meetsthreshold$id
  correctedfilenumbers <- str_pad(ids, 3, pad = 0)
  for(i in correctedfilenumbers){
    filename = paste(directory, '/', i, '.csv', sep = "")
    csvresult = read.csv(filename)
    mydata = data.frame(csvresult)
    all <- mydata[complete.cases(mydata),]
    results <- c(results, cor(all$sulfate, all$nitrate))
  }
  results
}
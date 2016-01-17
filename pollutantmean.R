library(stringr)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  datapoints <- numeric()
  counter <- 1
  correctedfilenumbers <- str_pad(id, 3, pad = 0)
  for(i in correctedfilenumbers) {
    filename = paste(directory, '/', i, '.csv', sep = "")
    csvresult = read.csv(filename)
    mydata = data.frame(csvresult)
    okvalues = !is.na(mydata[pollutant])
    pollutantdata = mydata[pollutant]
    datapoints <- c(datapoints, pollutantdata[okvalues])
  }
 print(mean(datapoints))
}
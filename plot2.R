plot2 <- function(){
  df <- getFilteredData()
  #head(df)
  #df[1, "DateTime"]
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
  #df$dow <- format(as.POSIXlt(df[, "Date"], format = "%d/%m/%Y"), format = '%a')
  
  wh <- 480  #504 = for reproduction of example exactly, 480 = assignment requirement
  png(filename = "~/Documents/coursera/ExData/data/plot2.png", width = wh, height = wh,bg = "white")
  plot(df$datetime, df$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  dev.off()
  #plot(Date, Global_active_power, data = df,  type="l")
  #rowcnt <- nrow(df)
  #axis(1, at = c(1,((rowcnt/2)+1),rowcnt), labels = c('Thu', 'Fri', 'Sat'))
  #df$dow
}


test3 <- function(){
  df <- getFilteredData()
  #df[1, "Date"]
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
  #df$dow <- format(as.POSIXlt(df[, "Date"], format = "%d/%m/%Y"), format = '%a')
  #format(d, format = '%a')
  rowcnt <- nrow(df)
  xax <- c(format(as.POSIXlt(df[1, "Date"], format = "%d/%m/%Y"), format = '%a'),
           format(as.POSIXlt(df[(rowcnt/2)+1, "Date"], format = "%d/%m/%Y"), format = '%a'),
           format(as.POSIXlt(df[rowcnt, "Date"], format = "%d/%m/%Y"), format = '%a'))
  xax
}
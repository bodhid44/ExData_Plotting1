plot2 <- function(){
  df <- getFilteredData()
  #head(df)
  #df[1, "DateTime"]
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
  df$dow <- format(as.POSIXlt(df[, "Date"], format = "%d/%m/%Y"), format = '%a')
  
  plot(df$Global_active_power, type="l")
}

test3 <- function(){
  df <- getFilteredData()
  #df[1, "Date"]
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
  df$dow <- format(as.POSIXlt(df[, "Date"], format = "%d/%m/%Y"), format = '%a')
  #format(d, format = '%a')
  head(df)
}
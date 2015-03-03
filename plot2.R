plot2 <- function(){
  df <- getFilteredData()
  #head(df)
  plot(df$Global_active_power, type="l")
  #df[1, "DateTime"]
  
  #as.POSIXlt(df[1, "Date"], format = "%d/%m/%Y")$wday
  class(df[1, "DateTime"])
}
# Exploratory Data Analysis - Assignment #1

## Assignment: 
Create four R files, each of which recreates a designated plot using a subset of the “Individual household electric power consumption Data Set”.

## Notes:

1. All four "plot" script files (plot1.R ~ plot4.R) and the data download/cache script (HouseholdPowerConsumption.Reader.R) should be in the same directory. To create each plot, source the file and run the function, e.g 
> source("plot1.R"); plot1();

2. The "lubridate" package should be installed [for working with dates]

3. As developed on Linux and the original file is available via https, the "RCurl" package should be installed

4. Getting the data. A simple caching mechanism is used to download the original zip file from the internet, unzip, load into a  dataframe, subset the data for the two required days, convert Date and Time columns to date/time and create a new combined column named 'datetime' containing both date and time. If filtered dataframe has already been created, a cached version will be used. *Requires the HouseholdPowerConsumption.Reader.R file to be present in the same directory as the four plot R source files.*

5. Functions plot1() ~ plot4(). Each function outputs the required plot as a png file with the same name as the function to the local working directory. Additionally, each function has a single optional parameter named 'plotsize' with a default value of 480. Using a value of 504 will create the plots with exactly the same size as the originals. This allows both the plot to be easily compared to the original using an image editor (_e.g. gimp_). As the original has a transparent background, simply import the original as a new layer into the file created and visually confirm the accuracy of the plot. 

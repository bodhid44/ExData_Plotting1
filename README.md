# Exploratory Data Analysis - Assignment #1

## Assignment: 
Create four R files, each of which recreates a designated plot using a subset of the “Individual household electric power consumption Data Set”.

## Notes:

1. Getting the data. Simple caching mechanism used to download the original zip file from the internet, unzip, load in dataframe, subset the data for the two required days, convert Date and Time columns to date/time and create a new combined column named 'datetime' containing both date and time. If data already created, cached version will be used. *Requires the HouseholdPowerConsumption.Reader.R file to be present in the same directory as the four plot R source files.*

2. Functions plot1() ~ plot4(). Each function outputs the required plot as a png file with the same name as the function to the local working directory. Additionally, each function has a single optional parameter named 'plotsize' with a default value of 480. Using a value of 504 will create the plots with exactly the same size as the originals. This allows both the plot to be easily compared to the original using an image editor (_e.g. gimp_). As the original has a transparent background, simply import the original as a new layer into the file created and visually confirm the accuracy of the plot. 

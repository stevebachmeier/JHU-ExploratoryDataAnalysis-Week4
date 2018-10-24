# Summary

There is strong evidence that fine particulate matter (particles with a diameter 2.5 microns or larger (PM2.5)) is an ambient air pollutant that is harmful to human halth. The EPA sets national ambient air quality standards and approximately every three years it releases its database on PM2.5 emissions.

Reference: https://www.epa.gov/air-emissions-inventories

# Assignment Goal

Answer each of the following six questions with a single plot:

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Instructions

For each plot:

* Construct the plot and save it to a PNG file.

* Create a separate R code file (plot1.R, plot2.R, etc) that constructs the corresponding plot. Each file should be self-standing, ie each file should read in the code, clean it, and produce the plot.

* Upload the PNG file on the Assignment submission page.

* Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assignment.

# Data

The data for this assignment is available as a single zip file at: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two files:

* summarySCC_PM25.rds: PM2.5 Emissions Data. This contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. for each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.

  ** fips: a five-digit number (string) indicating the U.S. country
  
  ** SCC: the name of the source as indicated by a digit string
  
  ** Pollutant: a string indicating the pollutant
  
  ** Emissions: Amount of PM2.5 in tons
  
  ** type: the type of source (point, non-point, on-road, or non-road)
  
  ** year: the year of emissions recorded
  
* Source_Classification_Code.rds: Source Classification Code Table. this table provides a maping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source.

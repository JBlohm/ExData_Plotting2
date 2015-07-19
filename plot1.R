##
## plot1.R
##
## 19.07.2015 JBlohm
##
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
## for each of the years 1999, 2002, 2005, and 2008.
##
## Will likely take a few seconds to read the data. So be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_emissions_per_year <- aggregate( Emissions ~ year, NEI, sum)

png(filename = "plot1.png", width = 480, height = 480)
plot(total_emissions_per_year$year, total_emissions_per_year$Emissions, type="l", main="Total Emissions PM2.5", xlab="Year", ylab="Emissions (tons)")
dev.off()

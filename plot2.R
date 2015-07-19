##
## plot2.R
##
## 19.07.2015 JBlohm
##
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.
##
## Will likely take a few seconds to read the data. So be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset for Baltimore City, Maryland (fips == "24510")
NEI <- NEI[NEI$fips=="24510",]
total_emissions_per_year <- aggregate( Emissions ~ year, NEI, sum)

png(filename = "plot2.png", width = 480, height = 480)
plot(total_emissions_per_year$year, total_emissions_per_year$Emissions, type="l", main="Total Emissions PM2.5 Baltimore City, Maryland", xlab="Year", ylab="Emissions (tons)")
dev.off()

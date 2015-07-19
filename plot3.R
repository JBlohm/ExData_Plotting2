##
## plot3.R
##
## 19.07.2015 JBlohm
##
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008?
## Use the ggplot2 plotting system to make a plot answer this question.
##
library(ggplot2)
## Will likely take a few seconds to read the data. So be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset for Baltimore City, Maryland (fips == "24510")
NEI <- NEI[NEI$fips=="24510",]
## Aggregate by year and type
total_emissions_per_year <- aggregate( Emissions ~ year + type, NEI, sum)

png(filename = "plot3.png", width = 480, height = 480)
p <- qplot(year, Emissions, data = total_emissions_per_year, facets = . ~ type, geom = "line", main = "Baltimore City, Maryland PM2.5 Emissions by type", xlab = " Year", ylab = "Emissions (tons)")
print(p)
dev.off()

##
## plot5.R
##
## 19.07.2015 JBlohm
##
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##
## Will likely take a few seconds to read the data. So be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset for Baltimore City, Maryland (fips == "24510")
NEI <- NEI[NEI$fips=="24510",]

## Subset SCC for motor vehicle related emission sectors (EI.Sector contains word "Mobile")
SCC_mobile <- SCC[grepl(".*Mobile.*", SCC$EI.Sector),]

## Subset NEI for motor vehicle related sources (NEI$SCC in SCC_mobile$SCC)
NEI_mobile <- NEI[NEI$SCC %in% SCC_mobile$SCC,]

total_emissions_per_year <- aggregate( Emissions ~ year, NEI_mobile, sum)

png(filename = "plot5.png", width = 480, height = 480)
plot(total_emissions_per_year$year, total_emissions_per_year$Emissions, type="l", main="Total Baltimore City motor vehicle related emissions PM2.5", xlab="Year", ylab="Emissions (tons)")
dev.off()

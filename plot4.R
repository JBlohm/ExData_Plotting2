##
## plot4.R
##
## 19.07.2015 JBlohm
##
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
##
## Will likely take a few seconds to read the data. So be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC for coal related emission sectors (EI.Sector contains word "Coal")
SCC_coal <- SCC[grepl(".*Coal.*", SCC$EI.Sector),]

## Subset for Coal Combustion related sources (NEI$SCC in SCC_coal$SCC)
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC,]
total_emissions_per_year <- aggregate( Emissions ~ year, NEI_coal, sum)

png(filename = "plot4.png", width = 480, height = 480)
plot(total_emissions_per_year$year, total_emissions_per_year$Emissions, type="l", main="Total US Coal Combustion Related Emissions PM2.5", xlab="Year", ylab="Emissions (tons)")
dev.off()

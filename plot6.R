##
## plot6.R
##
## 19.07.2015 JBlohm
##
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
## vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?
##
## Will likely take a few seconds to read the data. So be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset for Baltimore City, Maryland (fips == "24510") and Los Angeles County, California (fips == "06037")
NEI <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]

## Subset SCC for motor vehicle related emission sectors (EI.Sector contains word "Mobile")
SCC_mobile <- SCC[grepl(".*Mobile.*", SCC$EI.Sector),]

## Subset for Coal Combustion related sources (NEI$SCC in SCC_coal$SCC)
NEI_mobile <- NEI[NEI$SCC %in% SCC_mobile$SCC,]

## Aggregate by year and type
total_emissions_per_year <- aggregate( Emissions ~ year + fips, NEI_mobile, sum)

city_names <- list(
  '24510'="Baltimore City",
  '06037'="Los Angeles County"
)

city_labeller <- function(variable,value){
  return(city_names[value])
}

png(filename = "plot6.png", width = 480, height = 480)
p <- ggplot(total_emissions_per_year, aes(x=year))
p <- p + geom_line(aes(y=Emissions))
p <- p + facet_grid(. ~ fips, labeller = city_labeller)
print(p)
dev.off()

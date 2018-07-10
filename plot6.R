# ---- IMPORT LIBRARIES ----
library(dplyr)
library(ggplot2)

# ---- DOWNLOAD DATA ----
NEI <- readRDS(file="data/summarySCC_PM25.rds")
SCC <- readRDS(file="data/Source_Classification_Code.rds")

# ---- CLEAN DATA ----

# ---- ANALYSIS
SCC_vehicles <- SCC[grepl("[Vv]ehicle", SCC$Short.Name),]
keep <- as.character(SCC_vehicles$SCC)
NEI_vehicles <- NEI[NEI$SCC %in% keep,]
NEI_vehicles_baltimore <- NEI_vehicles[NEI_vehicles$fips=="24510",]
NEI_vehicles_LA <- NEI_vehicles[NEI_vehicles$fips=="06037",]
summ_baltimore <- summarize(group_by(NEI_vehicles_baltimore, year), 
                  pm25_total=sum(Emissions))
summ_LA <- summarize(group_by(NEI_vehicles_LA, year), 
                            pm25_total=sum(Emissions))
summ_baltimore$City <- "Baltimore"
summ_LA$City <- "LA"
summ <- rbind(summ_baltimore, summ_LA)
# ---- CREATE PLOT ----
png(filename="plot6.png", width=480, height=480, units="px")
print(qplot(year, pm25_total, data=summ, color=City) + 
          geom_smooth(method="lm") +
          labs(x="Year", y="PM2.5 Emissions (tons)") +
          labs(title="PM2.5 Emissions - Vehicles"))
dev.off()
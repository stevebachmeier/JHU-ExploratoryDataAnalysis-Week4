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
summ <- summarize(group_by(NEI_vehicles_baltimore, year), 
                  pm25_total=sum(Emissions))

# ---- CREATE PLOT ----
png(filename="plot5.png", width=480, height=480, units="px")
print(qplot(year, pm25_total, data=summ) + 
          geom_smooth(method="lm") +
          labs(x="Year", y="PM2.5 Emissions (tons)") +
          labs(title="PM2.5 Emissions - Vehicles"))
dev.off()
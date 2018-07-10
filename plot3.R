# ---- IMPORT LIBRARIES ----
library(dplyr)
library(ggplot2)

# ---- DOWNLOAD DATA ----
NEI <- readRDS(file="data/summarySCC_PM25.rds")
SCC <- readRDS(file="data/Source_Classification_Code.rds")

# ---- CLEAN DATA ----

# ---- ANALYSIS
NEI_baltimore <- NEI[NEI$fips=="24510",]
summ <- summarize(group_by(NEI_baltimore, type, year), 
                                  pm25_total=sum(Emissions))

# ---- CREATE PLOT ----
png(filename="plot3.png", width=480, height=480, units="px")
print(qplot(year, pm25_total, data=summ) + 
    facet_wrap(.~type, nrow=2, ncol=2) +
    geom_smooth(method="lm") +
    labs(x="Year", y="PM2.5 Emissions (tons)") +
    labs(title="Baltimore PM2.5 Emissions By Type"))
dev.off()
# ---- IMPORT LIBRARIES ----
library(dplyr)

# ---- DOWNLOAD DATA ----
NEI <- readRDS(file="data/summarySCC_PM25.rds")
SCC <- readRDS(file="data/Source_Classification_Code.rds")

# ---- CLEAN DATA ----

# ---- ANALYSIS
NEI_baltimore <- NEI[NEI$fips=="24510",]
NEI_baltimore_yearly <- summarize(group_by(NEI_baltimore, year), 
                                  pm25_total=sum(Emissions))

# ---- CREATE PLOT ----
png(filename="plot2.png", width=480, height=480, units="px")
plot(NEI_baltimore_yearly, pch=20, main="Annual Baltimore PM2.5 Emissions", 
     ylab="PM2.5 Emissions (tons)", xlab="Year")
lines(NEI_baltimore_yearly, lty="dashed")
abline(lm(pm25_total ~ year, NEI_baltimore_yearly))
dev.off()
# ---- IMPORT LIBRARIES ----
library(dplyr)

# ---- DOWNLOAD DATA ----
NEI <- readRDS(file="data/summarySCC_PM25.rds")
SCC <- readRDS(file="data/Source_Classification_Code.rds")

# ---- CLEAN DATA ----

# ---- ANALYSIS
NEI_yearly <- summarize(group_by(NEI, year), pm25_total=sum(Emissions))

# ---- CREATE PLOT ----
png(filename="plot1.png", width=480, height=480, units="px")
plot(NEI_yearly, pch=20, main="Annual PM2.5 Emissions", 
     ylab="PM2.5 Emissions (tons)", xlab="Year")
lines(NEI_yearly, lty="dashed")
abline(lm(pm25_total ~ year, NEI_yearly))
dev.off()
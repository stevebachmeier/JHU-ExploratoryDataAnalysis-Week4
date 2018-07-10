# ---- IMPORT LIBRARIES ----
library(dplyr)
library(ggplot2)

# ---- DOWNLOAD DATA ----
NEI <- readRDS(file="data/summarySCC_PM25.rds")
SCC <- readRDS(file="data/Source_Classification_Code.rds")

# ---- CLEAN DATA ----

# ---- ANALYSIS
SCC_CoalComb <- SCC[(grepl("[Cc]omb+(.*)", SCC$Short.Name) & 
                         grepl("[Cc]oal", SCC$Short.Name)),]
keep <- as.character(SCC_CoalComb$SCC)
NEI_CoalComb <- NEI[NEI$SCC %in% keep,]
summ <- summarize(group_by(NEI_CoalComb, year), pm25_total=sum(Emissions))

# ---- CREATE PLOT ----
png(filename="plot4.png", width=480, height=480, units="px")
print(qplot(year, pm25_total, data=summ) + 
          geom_smooth(method="lm") +
          labs(x="Year", y="PM2.5 Emissions (tons)") +
          labs(title="Coal Combustion PM2.5 Emissions"))
dev.off()
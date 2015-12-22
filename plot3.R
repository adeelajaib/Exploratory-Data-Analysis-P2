closeAllConnections()
rm(list=ls())

setwd("/home/adeel/Documents/computer-science/data-science/exploratory-data-analysis/second-project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)
d1bb<-subset(NEI, NEI$fips==24510)

png("plot3.png", width = 800, height = 480) 
g<-ggplot(d1bb, aes(x=year, y=Emissions))
g +
  stat_summary(fun.y=sum, colour="red", geom="line", size = 1) +
  facet_grid(. ~ type)+
  labs(y = "Total PM2.5 Emissions", title="Total PM2.5 emissions in Baltimore by Source Type")
dev.off()

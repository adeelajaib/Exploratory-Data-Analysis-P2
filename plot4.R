closeAllConnections()
rm(list=ls())

setwd("/home/adeel/Documents/computer-science/data-science/exploratory-data-analysis/second-project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(ggplot2)
library(scales)

#get coal SCC
coal<-unique(SCC[,1][grepl("Coal",SCC[,3], ignore.case = TRUE)])

# find subset of NEI for coal
dcoal<-subset(NEI, NEI$SCC%in%coal)
#NEI[coal %in% NEI$SCC]


png("plot4.png", width = 480, height = 480) 
c1<-ggplot(dcoal, aes(x=year, y=Emissions))
c1 + 
  stat_summary(fun.y=sum, colour="red", geom="line", size = 1) +
  scale_y_continuous(labels = scientific) +
  labs(y = "Total PM2.5 Emissions", title="Coal emissions across US")
dev.off()



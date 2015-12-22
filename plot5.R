closeAllConnections()
rm(list=ls())

setwd("/home/adeel/Documents/computer-science/data-science/exploratory-data-analysis/second-project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor<-unique(SCC[,1][grepl("vehicle",SCC[,4], ignore.case = TRUE)])

dmotor<-subset(NEI, NEI$SCC%in%motor)
dmotorb<-subset(dmotor, dmotor$fips=="24510" )

png("plot5.png", width = 480, height = 480) 
m1<-ggplot(dmotorb, aes(x=year, y=Emissions))
m1 + 
  stat_summary(fun.y=sum, colour="red", geom="line", size = 1) +
  labs(y = "Total PM2.5 Emissions", title="MV PM2.5 emissions in Baltimore")
dev.off()



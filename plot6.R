closeAllConnections()
rm(list=ls())

setwd("/home/adeel/Documents/computer-science/data-science/exploratory-data-analysis/second-project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


motor<-unique(SCC[,1][grepl("vehicle",SCC[,4], ignore.case = TRUE)])

dmotor<-subset(NEI, NEI$SCC%in%motor)
dmotorb<-subset(dmotor, dmotor$fips=="24510" )
dmotorla<-subset(dmotor, dmotor$fips=="06037")


png("plot6.png", width = 480, height = 480) 
m2<-ggplot(dmotorla, aes(x=year, y=Emissions))
m2 + 
  stat_summary(aes(x=year, y=Emissions, colour="LA"), fun.y=sum, geom="line") + 
  stat_summary(data=dmotorb,aes(x=year, y=Emissions, colour="Baltimore"), fun.y=sum, geom="line") +
  labs(y = "Total PM2.5 Emissions", title="MV PM2.5 emissions in Baltimore and LA") +
  scale_colour_manual(name="", 
                      values=c(LA="blue",Baltimore="red"))

dev.off()



closeAllConnections()
rm(list=ls())

setwd("/home/adeel/Documents/computer-science/data-science/exploratory-data-analysis/second-project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#find sums using subsets for plot

sum1b<-sum(NEI[,4][NEI[,6]==1999 & NEI[,1]==24510])
sum2b<-sum(NEI[,4][NEI[,6]==2002 & NEI[,1]==24510])
sum3b<-sum(NEI[,4][NEI[,6]==2005 & NEI[,1]==24510])
sum4b<-sum(NEI[,4][NEI[,6]==2008 & NEI[,1]==24510])


totalb<-c(sum1b,sum2b,sum3b,sum4b)
year<-c(1999,2002,2005,2008)

#plot
png("plot2.png", width = 480, height = 480) 
reg<-lm(totalb~year)
plot(year,totalb,xlab="Year",ylab="Total PM2.5 Emissions")
abline(reg)
title(main="Total PM2.5 emissions in Baltimore")
dev.off()



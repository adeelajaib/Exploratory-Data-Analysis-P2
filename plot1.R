closeAllConnections()
rm(list=ls())

#read data 
setwd("/home/adeel/Documents/computer-science/data-science/exploratory-data-analysis/second-project")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#find sums using subsets for plot

sum1<-sum(NEI[,4][NEI[,6]==1999])
sum2<-sum(NEI[,4][NEI[,6]==2002])
sum3<-sum(NEI[,4][NEI[,6]==2005])
sum4<-sum(NEI[,4][NEI[,6]==2008])

total<-c(sum1,sum2,sum3,sum4)
year<-c(1999,2002,2005,2008)

#plot
reg<-lm(total~year)
png("plot1.png", width = 480, height = 480) 
plot(year,total,xlab="Year",ylab="Total PM2.5 Emissions")
abline(reg)
title(main="Total PM2.5 emissions in the US")
dev.off()

#with ggplot
#g<-ggplot(NEI, aes(x=year, y=Emissions))
#g+geom_point()+stat_summary(fun.y=sum, colour="red", geom="line", size = 1)


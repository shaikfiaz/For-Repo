#rm(list=ls())
library(data.table)
DownloadedDataDir="/Users/Rahela/Documents/Data Science/Data/Downloaded"
setwd=DownloadedDataDir
HousingData=fread("/Users/Rahela/Documents/Data Science/Data/Downloaded/household_power_consumption.txt",header = TRUE,sep=";")
#HousingData1=transform(HousingData,Date=as.Date(Date,format="%d/%m/%Y"),Time=strptime(Time,format = "%H:%M:%S",tz="UTC"))
HousingData$Date=as.Date(HousingData$Date,format="%d/%m/%Y")
HousingData_Sub=subset(HousingData,HousingData$Date>="2007-02-01" & HousingData$Date<="2007-02-02")

par(mfrow=c(1,1))
par(mar=c(5,5,4,1))
hist(as.numeric(HousingData_Sub$Global_active_power),xlab = "Global Active Power (kilowatts)",col="red",main="Gloabl Active Power")                   
dev.copy(png, file = "/Users/Rahela/Documents/Data Science/Data/Downloaded/plot1.png") 
dev.off() 

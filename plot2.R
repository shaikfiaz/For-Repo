rm(list=ls())
library(data.table)
DownloadedDataDir="/Users/Rahela/Documents/Data Science/Data/Downloaded"
setwd=DownloadedDataDir
HousingData=fread("/Users/Rahela/Documents/Data Science/Data/Downloaded/household_power_consumption.txt",header = TRUE,sep=";")
HousingData$DateAndTime=paste(HousingData$Date, HousingData$Time)
HousingData$Date=as.Date(HousingData$Date,format="%d/%m/%Y")

HousingData_Sub=subset(HousingData,HousingData$Date>="2007-02-01" & HousingData$Date<="2007-02-02")
A=strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
par(mar=c(5,5,4,1))
plot(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "/Users/Rahela/Documents/Data Science/Data/Downloaded/plot2.png") 
dev.off() 

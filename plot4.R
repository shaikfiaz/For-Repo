rm(list=ls())
library(data.table)
DownloadedDataDir="/Users/Rahela/Documents/Data Science/Data/Downloaded"
setwd=DownloadedDataDir
HousingData=fread("/Users/Rahela/Documents/Data Science/Data/Downloaded/household_power_consumption.txt",header = TRUE,sep=";")
HousingData$DateAndTime=paste(HousingData$Date, HousingData$Time)
HousingData$Date=as.Date(HousingData$Date,format="%d/%m/%Y")

HousingData_Sub=subset(HousingData,HousingData$Date>="2007-02-01" & HousingData$Date<="2007-02-02")
par(mfrow=c(2,2))
par(mar=c(4,5,1,1))
plot(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Global_active_power,type = "l",ylab = "Global Active Power", xlab="")
par(mar=c(4,5,1,1))
plot(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Voltage,type = "l",ylab = "Voltage", xlab="datetime")
par(mar=c(4,5,1,1))
plot(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Sub_metering_1,type = "n",ylab = "Energy sub metering", xlab="")
points(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Sub_metering_1,col="black",type="l")
points(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Sub_metering_2,col="red",type="l")
points(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
par(mar=c(4,5,1,1))
plot(strptime(HousingData_Sub$DateAndTime,"%d/%m/%Y %H:%M:%S"),HousingData_Sub$Global_reactive_power,type = "l",ylab = "Global reactive Power", xlab="datetime")



dev.copy(png, file = "/Users/Rahela/Documents/Data Science/Data/Downloaded/plot4.png") 
dev.off() 

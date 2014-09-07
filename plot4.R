data3<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data4<-data3[1]
data5<-data4=="1/2/2007"
data6<-data3[data5,]
data7<-data4=="2/2/2007"
data8<-data3[data7,]
data9<-rbind(data6,data8)

Sys.setlocale("LC_TIME", "English")
Datetime2<-as.POSIXct(paste(data9$Date, data9$Time), format = "%d/%m/%Y %T")



#Plot4
data9$Global_active_power<-as.numeric(levels(data9$Global_active_power))[data9$Global_active_power]
data9$Voltage<-as.numeric(levels(data9$Voltage))[data9$Voltage]
data9$Global_reactive_power<-as.numeric(levels(data9$Global_reactive_power))[data9$Global_reactive_power]
data9$Sub_metering_1<-as.numeric(levels(data9$Sub_metering_1))[data9$Sub_metering_1]
data9$Sub_metering_2<-as.numeric(levels(data9$Sub_metering_2))[data9$Sub_metering_2]
data9$Sub_metering_3<-as.numeric(levels(data9$Sub_metering_3))[data9$Sub_metering_3]


par(mfrow=c(2,2))

plot(Datetime2, data9$Global_active_power, ylab="Global Active Power",type="line", lwd=1, xlab="")

plot(Datetime2, data9$Voltage, ylab="Voltage",type="line", xlab="datatime")

plot(1:2880, data9$Sub_metering_1, ylab="Energy sub metering",type="line", xlab="")
lines(data9$Sub_metering_2, col="red")
lines(data9$Sub_metering_3, col="blue")
legend("topright", pch = NA_integer_, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, cex=0.6, bty="n")

plot(Datetime2, data9$Global_reactive_power, ylab="Global_reactive_power",type="line", xlab="datatime")

dev.copy(png, file = "plot4.png") 
dev.off() 




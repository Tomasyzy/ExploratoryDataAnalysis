data3<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data4<-data3[1]
data5<-data4=="1/2/2007"
data6<-data3[data5,]
data7<-data4=="2/2/2007"
data8<-data3[data7,]
data9<-rbind(data6,data8)
Sys.setlocale("LC_TIME", "English")

#Plot3
data9$Sub_metering_1<-as.numeric(levels(data9$Sub_metering_1))[data9$Sub_metering_1]
data9$Sub_metering_2<-as.numeric(levels(data9$Sub_metering_2))[data9$Sub_metering_2]
data9$Sub_metering_3<-as.numeric(levels(data9$Sub_metering_3))[data9$Sub_metering_3]

Datetime2<-as.POSIXct(paste(data9$Date, data9$Time), format = "%d/%m/%Y %T")
data10<-cbind(data9,Datetime2)

par(mar=c(0.5,4,4,4))
plot(1:2880, data10$Sub_metering_1, ylab="Energy sub metering",type="line", xlab="")
lines(data10$Sub_metering_2, col="red")
lines(data10$Sub_metering_3, col="blue")
legend("topright", pch = NA_integer_, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, cex=0.8)
dev.copy(png, file = "plot3.png") 
dev.off() 

































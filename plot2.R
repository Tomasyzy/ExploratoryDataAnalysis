data3<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data4<-data3[1]
data5<-data4=="1/2/2007"
data6<-data3[data5,]


data7<-data4=="2/2/2007"
data8<-data3[data7,]
data9<-rbind(data6,data8)

data9$Global_active_power<-as.numeric(levels(data9$Global_active_power))[data9$Global_active_power]
Sys.setlocale("LC_TIME", "English")
Datetime2<-as.POSIXct(paste(data9$Date, data9$Time), format = "%d/%m/%Y %T")

#Plot2
plot(Datetime2, data9$Global_active_power, ylab="Global Active Power (kilowatts)",type="line", xlab="")
dev.copy(png, file = "plot2.png") 
dev.off() 



































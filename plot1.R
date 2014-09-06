data3<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data4<-data3[1]
data5<-data4=="1/2/2007"
data6<-data3[data5,]
data6
head(data6)

data7<-data4=="2/2/2007"
data8<-data3[data7,]
data9<-rbind(data6,data8)

data9$Global_active_power<-as.numeric(levels(data9$Global_active_power))[data9$Global_active_power]


#Plot 1
hist(data9$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="orangered1")
dev.copy(png, file = "plot1.png") 
dev.off() 


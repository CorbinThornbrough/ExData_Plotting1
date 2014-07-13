hpc<-read.table("household_power_consumption.txt",header=F, sep=";", nrows= 2879, skip=66637, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hpc<-data.frame(lapply(hpc, as.character), stringsAsFactors=FALSE)
hpc$datetime<-strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc<-subset(hpc,select=-c(Date,Time))
hpc[,c(1:7)]<-sapply(hpc[,c(1:7)],as.numeric)

par(mfrow=c(2,2), cex=0.7)

plot(hpc$datetime,hpc$Global_active_power, type="l", ylab="Global Active power", xlab="")

plot(hpc$datetime,hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(hpc$datetime,hpc$Sub_metering_1,type="S", ylab="Energy sub metering", xlab="")
lines(hpc$datetime,hpc$Sub_metering_2,col="red")
lines(hpc$datetime,hpc$Sub_metering_3,col="blue")
legend("top",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1),bty="n")

plot(hpc$datetime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
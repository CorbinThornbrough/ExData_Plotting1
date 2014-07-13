hpc<-read.table("household_power_consumption.txt",header=F, sep=";", nrows= 2879, skip=66637, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
hpc<-data.frame(lapply(hpc, as.character), stringsAsFactors=FALSE)
hpc$datetime<-strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc<-subset(hpc,select=-c(Date,Time))
hpc[,c(1:7)]<-sapply(hpc[,c(1:7)],as.numeric)
hist(hpc$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
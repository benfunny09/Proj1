r10 <- read.table("household_power_consumption.txt", header=TRUE, nrows=10)
classes <- sapply(r10,class)
r <- read.table("household_power_consumption.txt",header=TRUE, sep=";" , colClasses=classes)



#convert to Date
r$Date2 <-as.Date(factor(r$Date),"%d/%m/%Y")

r2007 <-subset(r, r$Date2 >= as.Date("2007-02-01") & r$Date2<=as.Date("2007-02-02"))

r2007$Global_active_power2 <- as.numeric(as.character(r2007$Global_active_power))
r2007$Sub_metering_1 <- as.numeric(as.character(r2007$Sub_metering_1))
r2007$Sub_metering_2 <- as.numeric(as.character(r2007$Sub_metering_2))
r2007$Sub_metering_3 <- as.numeric(as.character(r2007$Sub_metering_3))
r2007$DT<-strptime(paste(r2007$Date,r2007$Time,sep=","),format="%d/%m/%Y,%H:%M:%S")


#plot4png("plot4.png", width=480, height=480)

par(mfcol=c(2,2), mar=c(4,4,2,.5))


# GlobalAP
p2<-plot(r2007$DT, r2007$Global_active_power2,xlab="",ylab="Global Active Power",type="l")

#muli lines
tmp<-plot(
		r2007$DT
		,r2007$Sub_metering_1
		,type="l" 
		,ylab="Energy sub metering"
		,xlab=""
 )
lines(r2007$DT, r2007$Sub_metering_2, type="l", col="red")
lines(r2007$DT, r2007$Sub_metering_3, type="l", col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), cex=1) 

#volt
 p<-plot(r2007$DT,as.numeric(as.character(r2007$Voltage)), type="l", ylab="Voltage", xlab="datetime")

#global rp
p4<-plot(r2007$DT,as.numeric(as.character(r2007$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")

 
dev.off()











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


#plot1.R
png("plot1.png", width=480, height=480)
rhist2007<-hist(r2007$Global_active_power2, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", xlim=c(0,6),ylim=c(0,1200), axes=F)
axis(1,at=c(0,2,4,6))
axis(2,at=c(0,200,400,600,800,1000,1200))
dev.off()

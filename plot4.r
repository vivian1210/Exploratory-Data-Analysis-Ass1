setwd("C:\\Users\\Vivian\\Documents\\Coursera\\Exploratory Data Analysis\\")
data = read.table("household_power_consumption.txt", sep=";",header =T)
names(data)
data$Date = as.Date(data$Date,"%d/%m/%Y")
Newdata = data[which(data$Date == "2007-02-01"|data$Date == "2007-02-02"),]

Newdata = na.omit(Newdata)
WeekDay = weekdays(Newdata$Date)
time = paste(Newdata$Date,Newdata$Time)
Newtime = strptime(time,"%Y-%m-%d %H:%M:%S")
attach(Newdata)
png('plot4.png',width=480, height=480)
par(mfrow=c(2,2))
plot(Newtime,as.numeric(Newdata$Global_active_power)/500,type="l",ylab="Global Active Power (killowatts)",
     xlab="")
plot(Newtime,as.numeric(Voltage)/5,type="l",ylab="Voltage",xlab="datetime")
plot(Newtime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",ylim=c(0,40))
lines(Newtime,as.numeric(Sub_metering_2)/5,col="red")
lines(Newtime,Sub_metering_3,col="blue")
plot(Newtime,as.numeric(Global_reactive_power)/400,type="l",ylab="Global_reactive_power",ylim=c(0,0.5),
     xlab="datetime")
dev.off()
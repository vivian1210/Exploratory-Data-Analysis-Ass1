setwd("C:\\Users\\Vivian\\Documents\\Coursera\\Exploratory Data Analysis\\")
data = read.table("household_power_consumption.txt", sep=";",header =T)
names(data)
data$Date = as.Date(data$Date,"%d/%m/%Y")
Newdata = data[which(data$Date == "2007-02-01"|data$Date == "2007-02-02"),]

Newdata = na.omit(Newdata)
WeekDay = weekdays(Newdata$Date)
time = paste(Newdata$Date,Newdata$Time)
Newtime = strptime(time,"%Y-%m-%d %H:%M:%S")
png('plot2.png',width=480, height=480)
plot(Newtime,as.numeric(Newdata$Global_active_power)/500,type="l",ylab="Global Active Power (killowatts)",
     xlab="")
dev.off()
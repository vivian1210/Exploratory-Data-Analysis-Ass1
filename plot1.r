setwd("C:\\Users\\Vivian\\Documents\\Coursera\\Exploratory Data Analysis\\")
data = read.table("household_power_consumption.txt", sep=";",header =T)
names(data)
data$Date = as.Date(data$Date,"%d/%m/%Y")
Newdata = data[which(data$Date == "2007-02-01"|data$Date == "2007-02-02"),]

#plot 1
p1= hist(as.numeric(Newdata$Global_active_power)/500,col="red",xlab="Global Active Power (killowatts)",
         ylab="Frequency",main="Global Active Power")
png('plot1.png',width=480, height=480)
p1
dev.off()
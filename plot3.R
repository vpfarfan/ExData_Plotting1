getwd()
setwd("E:/Cursos/DS JHopkins/ExData_Plotting1")
df <- read.delim('Data/household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE)
df <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
df$Sub_metering_1 <- as.double(df$Sub_metering_1)
df$Sub_metering_2 <- as.double(df$Sub_metering_2)
df$Sub_metering_3 <- as.double(df$Sub_metering_3)

df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

png('plot3.png', width=480, height=480)
par(mfrow=c(1,1))
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
        , lty=c(1,1), lwd=2, col=c("black","red","blue"))

dev.off()
getwd()
setwd("E:/Cursos/DS JHopkins/ExData_Plotting1")
df <- read.delim('Data/household_power_consumption.txt', header=TRUE, sep=';', stringsAsFactors = FALSE)
summary(df)
df <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]
head(df)
df$Date <- as.Date(strptime(df$Date, format="%d/%m/%Y"))
df$Global_active_power <- as.double(df$Global_active_power)
df$Global_reactive_power <- as.double(df$Global_reactive_power)
df$Voltage <- as.double(df$Voltage)
df$Global_intensity <- as.double(df$Global_intensity)
df$Sub_metering_1 <- as.double(df$Sub_metering_1)
df$Sub_metering_2 <- as.double(df$Sub_metering_3)
df$DateTime <- paste(df$Date, df$Time, sep=' ')
strptime(df$DateTime, format="%Y-%m-%d %H:%M:%S")

df$DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

summary(df)
par(mfrow=c(1,1))
plot(df$DateTime, df$Global_active_power, type="l")

hist(df$Global_active_power, col="red", main="Global Active Power"
     , xlab = "Global Active Power(kilowatts)")

dev.copy(png, 'plot1.png', width=480, height=480)
dev.off()

ts()
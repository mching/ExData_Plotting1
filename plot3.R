# plot3.R

library(data.table)

dat <- fread("~/Downloads/household_power_consumption.txt", na.strings="?")
dat <- dat[dat$Date == "2/2/2007" | dat$Date == "1/2/2007"]
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

# Combine date and time
dat$Date_time <- paste(dat$Date, dat$Time)

# Can't figure out data.table method right now; revert to data.frame methods
dat <- as.data.frame(dat)
dat$Date_time <- strptime(dat$Date_time, format = "%Y-%m-%d %H:%M:%S")

# Set Sub_metering variables as a numeric variable
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)

# Create plot
png(file = "./figure/plot3.png", width = 480, height = 480)
plot(x = dat$Date_time, y = dat$Sub_metering_1, 
     ylab = "Energy sub metering",
     type = "l", xlab = ""
)
lines(dat$Date_time, dat$Sub_metering_2, col = "red")
lines(dat$Date_time, dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))
dev.off()

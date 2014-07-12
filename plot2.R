# plot2.R

library(data.table)

dat <- fread("~/Downloads/household_power_consumption.txt", na.strings="?")
dat <- dat[dat$Date == "2/2/2007" | dat$Date == "1/2/2007"]
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

# Combine date and time
dat$Date_time <- paste(dat$Date, dat$Time)

# Can't figure out data.table method right now; revert to data.frame methods
dat <- as.data.frame(dat)
dat$Date_time <- strptime(dat$Date_time, format = "%Y-%m-%d %H:%M:%S")

# Set Global active power as a numeric variable
dat$Global_active_power <- as.numeric(dat$Global_active_power)

# Create plot
png(file = "./figure/plot2.png", width = 480, height = 480)
plot(x = dat$Date_time, y = dat$Global_active_power, ylab = "Global Active Power (kilowatts)",
     type = "l", xlab = ""
     )
dev.off()

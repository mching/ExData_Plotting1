# plot1.R

library(data.table)

# Read in data
dat <- fread("~/Downloads/household_power_consumption.txt", na.strings="?")

# Subset on 01 Feb and 02 Feb 2007
dat <- dat[dat$Date == "2/2/2007" | dat$Date == "1/2/2007"]
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

# Set Global active power as a numeric variable
dat$Global_active_power <- as.numeric(dat$Global_active_power)

# Create plot
png(file = "./figure/plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

# Save plot

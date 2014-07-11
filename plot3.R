# plot 32 in R using Electric pwer consumption data

# load data only for dates 2007-02-01: 2007-02-02

#data <-read.csv("household_power_consumption.txt", na.strings="?")
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
# paste together Date and Time and convert to POSIXlt
DateTime<-strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
# Add DateTime var to data set
dat$DateTime <-DateTime

# create plot of 480x480 pixels
png(filename = "plot3.png", width=480, height=480, units = "px")
plot(dat$DateTime, dat$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines(dat$DateTime, dat$Sub_metering_1, col="black")
lines(dat$DateTime, dat$Sub_metering_2, col="red")
lines(dat$DateTime, dat$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue"))
dev.off()
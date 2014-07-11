# plot 2 in R using Electric pwer consumption data

# load data only for dates 2007-02-01: 2007-02-02

#data <-read.csv("household_power_consumption.txt", na.strings="?")
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
# paste together Date and Time and convert to POSIXlt
DateTime<-strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
# Add DateTime var to data set
dat$DateTime <-DateTime

# create plot of 480x480 pixels
png(filename = "plot2.png", width=480, height=480, units = "px")
plot(dat$DateTime, dat$Global_active_power, type="n",ylab="Global Active Power (kilowatts)", xlab="")
lines(dat$DateTime, dat$Global_active_power)
dev.off()
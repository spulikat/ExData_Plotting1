# This R Script generates a plot of Global Active Power using the Household Power Consumption dataset.

# Read in data from text file
powerdata <- read.csv("household_power_consumption.txt",sep=";",dec=".",na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)));

# Create subset of data for Feb 1-2, 2007
powersubset <- subset(powerdata, Date =="1/2/2007" | Date == "2/2/2007");

# Convert date and time fields into a single datetime formatted field
powerdatetime <-paste(powersubset$Date,powersubset$Time);
powerdatetime <- strptime(powerdatetime,format="%d/%m/%Y %H:%M:%S");
powersubset <- cbind(powerdatetime,powersubset);

# Generate PNG file, default is 480 x 480
png(filename="plot2.png",bg="transparent");
with(powersubset,plot(powerdatetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"));
dev.off();
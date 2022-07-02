###################
# Config Commands #
###################

library(tikzDevice)

file <- paste(getwd(), "/r-graphics/hist-plot.tex", sep = "")

tamanho <- 3.5

# path from project directory
tikzDevice::tikz(filename = file,
                 width = tamanho,
                 height = tamanho)


##################
# Make the graph #
##################

# Histogram
# Read values from tab-delimited autos.dat 
cars <- c(1, 3, 6, 4, 9)
trucks <- c(2, 5, 4, 5, 12)

# Calculate range from 0 to max value of cars and trucks
g_range <- range(0, cars, trucks)
# Graph cars with specified labels for axes.  Use blue 
# borders and diagonal lines in bars.
barplot(cars, xlab="Days",
        ylab="Total", names.arg=c("Mon","Tue","Wed","Thu","Fri"),
        border="blue", density=c(10,20,30,40,50))

##################
# Close the file #
##################
dev.off()

###################
# Config Commands #
###################

library(tikzDevice)

file <- paste(getwd(), "/r-graphics/box-plot.tex", sep = "")

tamanho <- 3.5

# path from project directory
tikzDevice::tikz(filename = file,
                 width = tamanho,
                 height = tamanho)


##################
# Make the graph #
##################

# BOXPLOT

boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
   ylab = "Miles Per Gallon")

##################
# Close the file #
##################
dev.off()

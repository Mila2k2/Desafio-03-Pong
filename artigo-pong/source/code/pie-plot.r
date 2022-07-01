###################
# Config Commands #
###################

library(tikzDevice)

file <- paste(getwd(), "/r-graphics/pie-plot.tex", sep = "")

tamanho <- 4

# path from project directory
tikzDevice::tikz(filename = file,
                 width = tamanho,
                 height = tamanho)

##################
# Make the graph #
##################

# Create Data
Prop <- c(3,7,9,1,2, 4)

# Make the default Pie Plot
pie(Prop)

##################
# Close the file #
##################
dev.off()

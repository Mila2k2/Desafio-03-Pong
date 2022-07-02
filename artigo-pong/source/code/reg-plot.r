library(tikzDevice)

tikz(paste(getwd(), "/r-graphics/reg-plot.tex", sep = ""),
     width=3.5,
     height=3.5)

x <- rnorm(10)
y <- x + rnorm(5,sd=0.25)

model <- lm(y ~ x)

rsq <- summary( model )$r.squared
rsq <- signif(rsq,4)

plot(x, y, main='Hello \\LaTeX!')

abline(model, col='red')
mtext(paste("Linear model: $R^{2}=",
            rsq, "$"), line=0.5)

legend('bottomright', legend =
         paste("$y = ",
               round(coef(model)[2],3), 'x +',
               round(coef(model)[1],3), '$',
               sep = ''), bty = 'n')
dev.off()
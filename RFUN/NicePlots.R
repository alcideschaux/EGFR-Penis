# Defining a function to describe categorical variables using a vertical barplot
descriptive.plot <- function(x, ...){
        x.table <- table(x)
        Plot <- barplot(x.table, ylab = "No. Patients", cex.lab = 1.25, ...)
        text(Plot, paste("N =", x.table), y = x.table, pos = 3)
}

# Defining a function to describe categorical variables using a horizontal barplot
descriptive.plot.h <- function(x, left = 4, ...){
        x.table <- table(x)
        par(mar = c(5, left, 4, 2) + 0.1, las = 1)
        Plot <- barplot(x.table, xlab = "No. Patients", cex.lab = 1.25, horiz = TRUE, ...)
        text(Plot, paste("N =", x.table), x = x.table, pos = 4)
}

# Defining a function to describe categorical variables using juxtaposed vertical bars
descriptive.plot.beside <- function(x, y, ...){
        table.beside <- table(x, y)
        compare.fisher <- fisher.test(x, y)
        P <- format(compare.fisher$p.value, digits = 2, width = 6)
        plot.beside <- barplot(table.beside, beside = TRUE, col = nice.colors,
                               ylab = "No. Patients", cex.lab = 1.25,
                               legend.text = TRUE,
                               args.legend = list(x = "topright", bty = "n"),
                               ...)
        text(plot.beside, paste(table.beside), y = table.beside, pos = 3)
        legend("topleft", bty = "n", paste("Fisher's exact test P value =", P))
}
# Defining a function to describe categorical variables using juxtaposed horizontal bars
descriptive.plot.beside.h <- function(x, y, ...){
        table.beside <- table(x, y)
        compare.fisher <- fisher.test(x, y)
        P <- format(compare.fisher$p.value, digits = 2, width = 6)
        plot.beside <- barplot(table.beside, beside = TRUE, col = nice.colors,
                               xlab = "No. Patients", cex.lab = 1.25,
                               horiz = TRUE,
                               legend.text = TRUE,
                               args.legend = list(x = "topright", bty = "n"),
                               ...)
        text(plot.beside, paste(table.beside), x = table.beside, pos = 4)
        legend("right", bty = "n", paste("Fisher's exact test P value =", P))
}
# Defining a function to describe numerical variables using a histogram + boxplot
descriptive.numeric <- function(x, col1 = "coral", col2 = "turquoise", label, ...){
        par(mfrow = c(1, 2), cex.lab = 1.25)
        hist(x, freq = FALSE, main = "", ylab = "Probability Density", xlab = label,
             col = col1, ...)
        lines(density(x, na.rm = TRUE), lwd = 1.5, ...)
        boxplot(x, col = col2, ylab = label, ...)
}
# Defining a function for boxplots and Kruskal-Wallis test
boxplot.kruskal <- function(x, ...){
        par(mar = c(5, 4, 1, 2))
        KW <- kruskal.test(x)
        KW.plot <- boxplot(x, cex.lab = 1.25, ...)
        legend("topleft", bty = "n",
               paste("Kruskal-Wallis test P value =", format(KW$p.value, digits = 2, width = 6)))
}
# Defining a function for mosaic plots with row proportions
mosaic.plot <- function(x, y, ...){
        xy <- table(x, y)
        xy.row <- 100*prop.table(xy, 1)
        xy.round <- round(xy.row, 1)
        mosaic(xy, shade = TRUE, pop = FALSE, ...)
        labeling_cells(text = xy.round, margin = 0)(xy)
}
# Defining a function for mosaic plots
compare.mosaic <- function(x, y, ...){
        par(mar = c(1, 1, 2, 1) + 0.1)
        mosaicplot(table(x, y), color = nice.colors,
                   xlab = "", ylab = "", cex.axis = 1, ...)
        par(mar = c(5, 4, 4, 2) + 0.1)
}

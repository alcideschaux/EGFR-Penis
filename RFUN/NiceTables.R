# Description of a single numerical variable
table.descriptive <- function(x){
        mean.x <- mean(x, na.rm = TRUE)
        sd.x <- sd(x, na.rm = TRUE)
        median.x <- median(x, na.rm = TRUE)
        iqr.x <- IQR(x, na.rm = TRUE)
        min.x <- min(x, na.rm = TRUE)
        max.x <- max(x, na.rm = TRUE)
        descriptive.x <- round(c(mean.x, sd.x, median.x, iqr.x, min.x, max.x), digits = 1)
        descriptive.names <- c("Mean", "Standard Deviation", "Median", "Interquartile Range",
                               "Mininum", "Maximum")
        final.table <- cbind("Statistics" = descriptive.names, "Values" = descriptive.x)
        kable(final.table)
}

# Description of a single categorical variable
table.proportions <- function(x){
        table.x <- table(x)
        percentage.x <- 100*prop.table(table.x)
        final.table <- cbind("No. Cases" = table.x, "%" = percentage.x)
        kable(final.table, digits = 1)
}
# 
table.compare <- function(x, y){
        mean.x <- tapply(x, INDEX = y, FUN = mean, na.rm = TRUE)
        sd.x <- tapply(x, INDEX = y, FUN = sd, na.rm = TRUE)
        median.x <- tapply(x, INDEX = y, FUN = median, na.rm = TRUE)
        iqr.x <- tapply(x, INDEX = y, FUN = IQR, na.rm = TRUE)
        min.x <- tapply(x, INDEX = y, FUN = min, na.rm = TRUE)
        max.x <- tapply(x, INDEX = y, FUN = max, na.rm = TRUE)
        final.table <- round(rbind("Mean" = mean.x, "Standard Deviation" = sd.x,
                                     "Median" = median.x, "Interquartile Range" = iqr.x,
                                     "Minimum" = min.x, "Maximum" = max.x), digits = 1)
        kable(final.table)
}
# 
cat.group <- function(x, y){
        table.xy <- table(x, y)
        row.xy <- round(100*(prop.table(table.xy, 1)))
        final.table <- cbind("Counts" = table.xy, "Rows %" = row.xy)
        kable(final.table)
}
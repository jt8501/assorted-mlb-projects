plots <- function() {
        library(ggplot2)
        
        ## Create histogram of 2013 WAR Distribution
        hit13 <- read.csv(".\\2013 mlb hitting.csv")
        png("WAR2013wardist.png", width=480, height=480)
        hist(hit13$WAR, breaks=25, col="red", xlab="WAR", 
             main="2013 WAR Distribution Among Qualified Hitters")
        dev.off()
        
        ## Create histogram of 2013 WAR distribution overlaid with 2012
        hit <- read.csv(".\\90-14 mlb hitting.csv")
        hit$Year
        
        dat13 <- hit13
        dat13$Year <- "2013"
        dat13 <- dat13[,c(21,23)]
        dat12 <- hit12
        dat12$Year <- "2012"
        dat12 <- dat12[,c(21,23)]
        dat <- rbind(dat12, dat13)
        dat$Year <- as.factor(dat$Year)
        qplot()
}
posvalueOT <- function() {
        ## Reads CSV files from FanGraphs of single-season data for a single 
        ## position over a given period of time.  Averages the offenseive, 
        ## defensive, and baserunning values (total runs generated) for all
        ## batting-title qualified MLB players and charts their contributions
        ## in each phase of the game over time.
        ## What does this tell you?  How a position has contributed to each 
        ## phase of the game over time.  Are shortstops more defensively or 
        ## offensively focused now vs. the past?  Same for any position and
        ## any phase of the game over any time period.
        
        library(ggplot2)
        library(reshape2)
        
        pos <- read.csv(".\\P5 since 1990.csv")
        colnames(pos)[1] <- "Season"
        pos <- pos[,c(1,19:21)]
        season <- list(as.factor(pos$Season))
        aggpos <- aggregate(pos, FUN=mean, by=season)
        aggpos <- aggpos[,2:5]
        aggpos$Season <- as.factor(aggpos$Season)
        aggpos2 <- melt(aggpos)
        aggpos2$Season <- as.numeric(as.character(aggpos2$Season))
        qplot(Season, value, data=aggpos2, color=variable, geom="line")
}
posbsrOT <- function() {
        ## Reads CSV files from FanGraphs and graphs the baserunning
        ## contributions from each position over time.  Answers the question,
        ## "How have the average speed/baserunning profile changed for each
        ## position over time?"
        
        bsr <- lapply(2:10, function(x) read.csv(paste0(".\\P",x," since 1990.csv")))
        bsr <- lapply(1:9, function(x) bsr[[x]][,c(1,19)])
        bsr <- lapply(1:9, function(x) setNames(bsr[[x]], nm=c("Season", "Bsr")))
        bsr <- lapply(1:9, function(x) aggregate(bsr[[x]],by=bsr[[x]][1], mean))
        bsr <- lapply(1:9, function(x) bsr[[x]][,2:3])
        bsr <- lapply(1:9, function(x) cbind(bsr[[x]], pos=x+1))
        bsr <- do.call(rbind, bsr)
        bsr[[1]] <- as.factor(bsr[[1]])
        bsr[[3]] <- as.factor(bsr[[3]])
        bsr$Season <- as.numeric(as.character(bsr$Season))
        
        
        
}
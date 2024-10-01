### R code from vignette source 'baySeq.Rnw'

set.seed(102)
options(width = 90)
library(baySeq)
#if(require("parallel")) cl <- makeCluster(4) else cl <- NULL
cl <- NULL


######################################################################################## PRIORS
input <- function(inputfile) {
CD <<- readRDS(inputfile)
}

run <- function() {}

output <- function(outputfile) {
CD@annotation <- data.frame(name = paste("count", 1:1000, sep = "_"))
libsizes(CD) <- getLibsizes(CD)
CD <- getPriors.NB(CD, samplesize = 1000, estimation = "QL", cl = cl)
saveRDS(CD, outputfile)
}
######################################################################################## 



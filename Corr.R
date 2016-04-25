corr <- function(directory, threshold = 0) {
  allfiles <- list.files("specdata")
  count=numeric(0)
  CorData=numeric(0)
  for(files in 1:length(allfiles)) {
    datacor <- read.csv(paste(getwd(),"specdata",allfiles[files],sep="/"))
    completeData=datacor[complete.cases(datacor),]
    count=nrow(completeData)
    
    
    if(count>=threshold)    
      CorData=c(CorData, cor(completeData$nitrate, completeData$sulfate))
  }
  CorDataFinal=na.omit(CorData)
  CorDataFinal
}

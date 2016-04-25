complete <- function(directory, id = 1:332) {
  vect1=numeric()
  vect2=numeric()
  for(file in id){
    filename=paste(directory,"/",sprintf("%03d.csv",file),sep="")
    data<-read.csv(filename)
    completeData=data[complete.cases(data),]
    nobs=nrow(completeData)
    vect1=c(vect1, nobs)
    vect2=c(vect2,file)
    
    
  }
  mydataframe <- data.frame(id=vect2, nobs= vect1)
  return(mydataframe)
}
setwd("h:/amiller/r programming")
source("complete.r")
complete("specdata", 23)
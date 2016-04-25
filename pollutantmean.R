pollutantmean<-function(directory,pollutant, id=1:332){
  totalsum <- 0 
  totallength<-0
  for(file in id){
    filename=paste("specdata","/",sprintf("%03d",file),".csv",sep="")
    print(filename)
    data=read.csv(filename)
    outputsum=sum(na.omit(data[[pollutant]]))
    outputlength=length(na.omit(data[[pollutant]]))
    totalsum=totalsum + outputsum
    totallength=totallength + outputlength
    
    
  }
  print(totalsum/totallength)
  
  
}
setwd(dir="D:/R/HD/")
state <- "SC"
outcome <- "heart attack"

best <- function(state, outcome) {
  ## Read outcome data
  
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  states <- unique(df$State)
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(state %in% states)) {
    stop("invalid state")
  }
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  df2 <- df[df$State == state, ]
  df2[, c(11, 17, 23)] <- sapply(df2[, c(11, 17, 23)], as.numeric)
  df2 <- df2[order(df2[, 2]), ]
  
  if (outcome == "heart attack") {
    best <- df2[which.min(df2[, 11]), "Hospital.Name"]
  }
  else if (outcome == "heart failure") {
    best <- df2[which.min(df2[, 17]), "Hospital.Name"]
  }
  else {
    best <- df2[which.min(df2[, 23]), "Hospital.Name"]
  }
  
  best
}
# best() - A function that returns the hospital with the lowest death rate for a specified outcome and state
#read in data: 
#     col 2: hospital name
#     col 7: State
#     col 11: heart attack (30 day death rate)
#     col 17: heart failure (30 day death rate)
#     col 23: pneumonia (30 day death rate)
#     
# exclude hospitals without data for given outcome
# Check that state and outcome are valid
# Return hospital name in that state with lowest 30-day death rate:
# if tie: sort in alphabetical order and return first


best <- function(state, outcome) {
    #Reads in relevant outcome data (name, state, fatal outcome rates)
    hosp_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2,7,11,17,23)]
    #Reassign names to make table more legible
    myNames <- c("Hospital.Name", "State", "Heart.Attack", "Heart.Failure", "Pneumonia")
    names(hosp_data) <- myNames
    #Coerce outcome columns (i.e., only columns 3 to 5) to numeric data type. 
    for (c in seq(3,5,1)){
        hosp_data[,c]<-suppressWarnings(as.numeric(hosp_data[,c]))
    }
    # Handle case in which invalid state is entered.
    #state <- "NC"
    try (if (!(state %in% hosp_data$State)) stop("invalid state", call. = FALSE))
    # Handle case in which invalid outcome is entered.
    #outcome <-"Heart.Attack"
    try (if (!(outcome %in% names(hosp_data)[3:5])) stop("invalid outcome", call. = FALSE))
    # Subset of data that is dealing with desired outcome and has no missing values.
    query <- hosp_data[hosp_data$State==state, c("Hospital.Name", outcome)]
    query <- query[complete.cases(query),]
    # Return hospital with lowest outcome rate:
    lowest<-query[which.min(query[,2]),]
    # If there are multiple lowest outcome rates, return the hospital that comes first in the alphabet
    suppressWarnings(lowest[order(lowest[1])][1,])
    
}

# rankhospital(state, outcome, ranking="best", "worst", or number) - function that returns the 
# hospital with specified ranking per outcome and state

rankhospital <- function(state, outcome, ranking) {
    #Reads in relevant outcome data (name, state, fatal outcome rates)
    hosp_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2,7,11,17,23)]
    #Reassign names to make table more legible
    myNames <- c("Hospital.Name", "State", "Heart.Attack", "Heart.Failure", "Pneumonia")
    names(hosp_data) <- myNames
    #Coerce outcome columns (i.e., only columns 3 to 5) to numeric data type. 
    for (c in seq(3,5,1)){
        hosp_data[,c]<-suppressWarnings(as.numeric(hosp_data[,c]))
    }
    # Handle case in which invalid state is entered.
    #state <- "NC"
    try (if (!(state %in% hosp_data$State)) stop("invalid state", call. = FALSE))
    # Handle case in which invalid outcome is entered.
    #outcome <-"Heart.Attack"
    try (if (!(outcome %in% names(hosp_data)[3:5])) stop("invalid outcome", call. = FALSE))
    # Handle case in which invalid ranking is entered.
    try (if (!(ranking=="best"|ranking == "worst"|is.numeric(ranking))) stop("invalid ranking", call. = FALSE))

    # Subset of data that is dealing with desired outcome and has no missing values.
    query <- hosp_data[hosp_data$State==state, c("Hospital.Name", outcome)]
    query <- query[complete.cases(query),]
    # Order the data by outcome rates, breaking ties with the alphabetical order of the hospital name (second argument to order() function).
    ordered <- query[order(query[,2], query$Hospital.Name),]
    
    if (ranking =="best"){ranking <- 1}
    if (ranking == "worst"){ranking<- nrow(query)}
    if (ranking>nrow(query)){print("ranking is out of range")}
    
    # Return hospital at specified ranking:
    ordered$Hospital.Name[ranking]
}

#rankall(outcome, ranking) - function that makes a data table of hospital names and state and returning the 
# hospital in each state that has specified ranking. Some might be NAs

rankall <- function(outcome, ranking=1) {
    #Reads in relevant outcome data (name, state, fatal outcome rates)
    hosp_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")[, c(2,7,11,17,23)]
    #Reassign names to make table more legible
    myNames <- c("Hospital.Name", "State", "Heart.Attack", "Heart.Failure", "Pneumonia")
    names(hosp_data) <- myNames
    #Coerce outcome columns (i.e., only columns 3 to 5) to numeric data type. 
    for (c in seq(3,5,1)){
        hosp_data[,c]<-suppressWarnings(as.numeric(hosp_data[,c]))
    }

    # Handle case in which invalid outcome is entered.
    #outcome <-"Heart.Attack"
    try (if (!(outcome %in% names(hosp_data)[3:5])) stop("invalid outcome", call. = FALSE))
    # Handle case in which invalid ranking is entered.
    try (if (!(ranking=="best"|ranking == "worst"|is.numeric(ranking))) stop("invalid ranking", call. = FALSE))
    
    #subset data so that only have the one dealing with desired outcome
    query <- hosp_data[, c("Hospital.Name", "State", outcome)]
    #split data based on states, then order each of these new frames by outcome (remember secondary argument)
    splitQ <- split(query, query$State)
    
    if (ranking =="best"){ranking <- 1}
    if (ranking == "worst"){ranking<- length(unique(query$State))}
    
    # Initiate rankall_table that will be the return product of this function
    rankall_table <- data.frame(matrix(nrow = 0, ncol = 2))
    colnames(rankall_table) <- c("Hospital.Name", "State")
    
    #pull hospital with desired ranking from each table and put into rankall_table   
    for (i in seq_along(splitQ)){
        q<-splitQ[[i]][complete.cases(splitQ[[i]]),]
        q <- q[order(q[,3], q[,1]),]
        # if (ranking is greater than the number of hospitals with data for this outcome in this state, return only state name and NA in hospital name column
        if (ranking<=nrow(q)){
            rankall_table[i,]<- q[ranking,]
        }
        else{
            rankall_table[i,]<-c(NA,q[1,2])
        }
    }
    rankall_table
}
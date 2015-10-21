## 09 final project

# data manipulation
data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# only need heart attack(11), heart failure(17), pneumonia(23) measures
data <- data[-(24:46)] # eliminate unnecesary variables
data <- data[-(12:16)]
data <- data[-(13:17)]
data <- data[-(4:5)]
data <- data[-8]
names(data)[8] <- "Heart_attack"
names(data)[9] <- "Heart_failure"
names(data)[10] <- "Pneumonia"


data$Heart_attack <- as.numeric(data$Heart_attack)
data$Heart_failure <- as.numeric(data$Heart_failure)
data$Pneumonia <- as.numeric(data$Pneumonia)
data[is.na(data)] <- 0  #convert NA's to Zero

dataS <- unique(sort(data[, "State"]))  # Vector with states

## filtering function

#' 
#' @p1 dt data.table
#' @p2 condition
#' @p3 states
#' @R  data.table
#'
seltop10 <- function(dt, conditi, states) {
        
        result = data[data$State %in% states, ]  # states is the vector
         
        if (conditi == "Heart Attack") {
                result$Selection <- result[,8]
        } else if (conditi == "Heart Failure") {
                result$Selection <- result[,9]
        } else if (conditi == "Pneumonia") {
                result$Selection <- result[,10]
        } else {
                result$Selection <- ""
        }
        return(result)
}


#' Plot best 10 hospitals
#' 
#' @p1 dt data.table
#' @p2 dom
#' @p3 xAxisLabel 
#' @p4 yAxisLabel 
#' @r  best10 hospitals plot
plottop10 <- function(dt, dom = "best10", 
                                xAxisLabel = "",
                                yAxisLabel = "avg monthly mortality") {
        dt <- dt[dt$Selection != 0, ]  # eliminate hospitals with 0 occurrences
        dt <- dt[order(dt$Selection),] # sorts by Selection 
        n <- nrow(dt)
        dtop10 <- dt[1:10,]
        best10 <- nPlot(
                Selection ~ Hospital.Name,
                data = dtop10,
                type = 'multiBarHorizontalChart',
                width = 650,
                dom = dom
        )
        best10$chart(margin = list(left = 200))
        best10$yAxis(axisLabel = yAxisLabel, width = 80)
        best10$xAxis(axisLabel = xAxisLabel, width = 80)
        best10
}


#' Plot worst 10 hospitals
#' 
#' @p1 dt data.table
#' @p2 dom
#' @p3 xAxisLabel 
#' @p4 yAxisLabel 
#' @r  worst 10 hospitals plot
plotbottom10 <- function(dt, dom = "worst10", 
                         xAxisLabel = "",
                         yAxisLabel = "Avg monthly mortality") {
        dt <- dt[order(dt$Selection),]  
        n <- nrow(dt)
        lim <- n - 10
        dbottom10 <- dt[lim:n,]
        worst10 <- nPlot(
                Selection ~ Hospital.Name,
                data = dbottom10,
                type = 'multiBarHorizontalChart',
                width = 650,
                dom = dom
        )
        worst10$chart(margin = list(left = 200))
        worst10$chart(color = c('red', 'blue', 'green'))
        worst10$yAxis(axisLabel = yAxisLabel, width = 80)
        worst10$xAxis(axisLabel = xAxisLabel, width = 80)
        worst10
}


# calculate summary statisctics for the selected condition & states
calcsummary <- function(dt, sd) {
        sd <- summary(dt$Selection)
}
 
       

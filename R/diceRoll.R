#################################
# 10/12/2016                    #
# Sven Nelson                   #
# diceRoll function             #
#################################

#' @export

diceRoll <- function(numOfDice, sides=6, hitLow = 4, double = 6) {
  x <- c()
  for (i in 1:numOfDice) {
    x[i] <- sample(1:sides, 1)
  }
  writeLines(paste("Roll:", paste(x, collapse = ' ')))
  #writeLines("\n")
  #dbNums <- (1:6)[double]
  writeLines(paste("Hits:", sum(x>=hitLow) + sum(x %in% double[double >= hitLow])))
}

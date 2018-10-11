
clean_data <- raw_data
readStates <- function(states)

{

states <- states[-1,]

num.row <- nrow(states)

states <- states[-num.row,]

states <- states[,-1:-4]

colnames(states) <- c("Statename","Population","Population over 18","perover18")


return(states)

}

clean_census <- readStates(raw_data)

str(clean_census)

c <- clean_census


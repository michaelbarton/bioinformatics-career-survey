survey.2012 <- function(){
  s <- survey('data/survey.csv')
  names(s)[3] <- 'gender'
  s
}

survey.2008 <- function(){
  survey('../2008/data/survey.csv')
}

survey <- function(file){
  within(read.csv(file, stringsAsFactors = FALSE),{
    Timestamp <- format.date.string(Timestamp, "%m/%d/%Y %H:%M:%S")
  })
}

format.date.string <- function(x,expr){
  as.Date(x, expr)
}

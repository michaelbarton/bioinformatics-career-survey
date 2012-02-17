survey <- function(){
  within(read.csv('data/survey.csv',stringsAsFactors = FALSE),{
    Timestamp <- format.date.string(Timestamp)
  })
}

format.date.string <- function(x){
  as.Date(x, "%m/%d/%Y %H:%M:%S")
}

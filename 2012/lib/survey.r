survey.2012 <- function(){
  s <- survey('data/survey.csv')
  names(s)[3]  <- 'gender'
  names(s)[9]  <- 'position'
  names(s)[30] <- 'birth.year'
  within(s,{
    position[position == ""] <- NA
    position <- factor(position, levels=c(
     "Under-graduate student",
     "Masters Student",
     "PhD Student",
     "Post Doctoral Scientist (Researcher)",
     "Post Doctoral Scientist (Staff)",
     "Principal Investigator / Lab Head / Management",
     "Senior Principal Investigator / Professor / Senior Management",
     "Staff Technician"))
  })
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

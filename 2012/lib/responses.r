country.data <- function(){
  library(rworldmap)
  data(countryExData)

  responses <- read.csv('data/analytics.csv')
  names(responses)[1] <- "Country"

  subset(
    merge(responses, countryExData[c('Country','ISO3V10')], by = "Country"),
    Visits >= 5)
}

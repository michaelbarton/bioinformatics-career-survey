country.data <- function(){
  library(rworldmap)
  data(countryExData)

  responses <- read.csv('data/analytics.csv', stringsAsFactors = FALSE)
  names(responses)[1] <- "Country"

  subset(
    merge(
      responses,
      countryExData[c('Country','ISO3V10','EPI_regions')],
      by = "Country"),
    Visits >= 5)
}

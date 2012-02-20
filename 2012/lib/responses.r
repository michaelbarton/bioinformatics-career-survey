completions <- function(){
  library(rworldmap)
  data(countryExData)

  responses <- read.csv('data/analytics.csv', stringsAsFactors = FALSE)
  names(responses)[2] <- "Country"

  subset(
    merge(
      responses,
      countryExData[c('Country','ISO3V10','EPI_regions')],
      by = "Country"),
    Unique.Pageviews >= 5)
}

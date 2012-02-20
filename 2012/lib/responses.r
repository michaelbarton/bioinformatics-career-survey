referrals <- function(){
  within(
    subset(
      read.csv('data/referrals.csv', stringsAsFactors = FALSE),
      Unique.Pageviews >= 5), {
    Source <- gsub("36ohk6dgmcd1n-c.c.yom.","",Source)
    Source <- gsub("^t.co$","twitter.com",Source)
    })
}

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

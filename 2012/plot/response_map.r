#!/usr/bin/env Rscript

library(rworldmap)
library(classInt)
library(RColorBrewer)

data(countryExData)

responses <- read.csv('data/analytics.csv')
names(responses)[1] <- "Country"

country.data <-
  subset(
    merge(responses, countryExData[c('Country','ISO3V10')], by = "Country"),
    Visits >= 5)

n.categories <- 5

intervals <- classIntervals(
  country.data[["Visits"]],
  n     = n.categories,
  style = "jenks")

png('map.png',width = 900)

par(mai = c(0, 0, 0.2, 0), xaxs = "i", yaxs = "i")

mapCountryData(
  joinCountryData2Map(
    country.data,
    joinCode         = "ISO3",
    mapResolution    = "coarse",
    nameJoinColumn   = "ISO3V10"),
  colourPalette    = brewer.pal(n.categories, "YlOrBr"),
  catMethod        = intervals[["brks"]],
  mapTitle         = "Survey Visits by Country",
  nameColumnToPlot = "Visits")

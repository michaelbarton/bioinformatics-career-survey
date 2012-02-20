#!/usr/bin/env Rscript

library(rworldmap)
library(classInt)
library(RColorBrewer)

source('lib/responses.r')

n.categories <- 5

intervals <- classIntervals(
  completions()[["Unique.Pageviews"]],
  n     = n.categories,
  style = "jenks")

png('responses_map.png',width = 900)

par(mai = c(0, 0, 0.2, 0), xaxs = "i", yaxs = "i")

mapCountryData(
  joinCountryData2Map(
    completions(),
    joinCode         = "ISO3",
    mapResolution    = "coarse",
    nameJoinColumn   = "ISO3V10"),
  colourPalette    = brewer.pal(n.categories, "YlOrBr"),
  catMethod        = intervals[["brks"]],
  mapTitle         = "Visits to Survey Completion Page by Country",
  nameColumnToPlot = "Unique.Pageviews")

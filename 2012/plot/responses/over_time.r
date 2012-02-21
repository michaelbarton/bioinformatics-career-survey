#!/usr/bin/env Rscript

library(plyr)
library(ggplot2)

source('lib/survey.r')
source('lib/generate_plot_file.r')

responses <- function(data,year){
  d <- ddply(data, .(Timestamp), function(df){
    data.frame(responses = nrow(df["Timestamp"]), year = year)
  })
  within(d,{
    Timestamp <- as.numeric(Timestamp)
    Timestamp <- Timestamp - min(Timestamp)
    responses <- cumsum(responses)
  })
}


p <- ggplot(
      rbind(
        responses(survey.2008(),2008),
        responses(survey.2012(),2012)),
      aes(x = Timestamp, y = responses, col = factor(year)))

p <- p + geom_smooth()
p <- p + geom_point()
p <- p + theme_bw()
p <- p + scale_x_continuous("Days")
p <- p + scale_y_continuous("Total responses")
p <- p + scale_colour_manual(name = "Year",values = c("red","blue"))

generate_plot_file(p,'responses_by_time.png')

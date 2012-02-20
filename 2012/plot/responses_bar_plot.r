#!/usr/bin/env Rscript

library(ggplot2)
source('lib/responses.r')

png('responses_bar_plot.png',width = 650)

p <- ggplot(
  within(country.data(),{
      Country <- factor(Country, levels=(Country[order(Visits)]))}),
  aes(x = Country, y = Visits, fill = EPI_regions))
p <- p + geom_bar()
p <- p + coord_flip()
p <- p + scale_fill_brewer('Region',palette="Set1")
p <- p + theme_bw()
p

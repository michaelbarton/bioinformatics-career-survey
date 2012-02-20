#!/usr/bin/env Rscript

library(ggplot2)
source('lib/responses.r')

png('total_responses.png',width = 650)

p <- ggplot(
  within(country.data(),{
      Country <- factor(Country, levels=(Country[order(Unique.Pageviews)]))}),
  aes(x = Country, y = Unique.Pageviews, fill = EPI_regions))
p <- p + geom_bar()
p <- p + coord_flip()
p <- p + scale_fill_brewer('Region',palette="Set1")
p <- p + scale_y_continuous('Visitors to the Completion Page')
p <- p + theme_bw()
p

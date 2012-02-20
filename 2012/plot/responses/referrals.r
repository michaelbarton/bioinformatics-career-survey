#!/usr/bin/env Rscript

library(ggplot2)
source('lib/responses.r')

png('referrals.png',width = 650)

p <- ggplot(
  within(referrals(),{
      Source <- factor(Source, levels=(Source[order(Unique.Pageviews)]))}),
  aes(x = Source, y = Unique.Pageviews))
p <- p + geom_bar()
p <- p + coord_flip()
p <- p + scale_y_continuous('Visitors to the Completion Page')
p <- p + theme_bw()
p

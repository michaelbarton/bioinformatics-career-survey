#!/usr/bin/env Rscript

library(ggplot2)
source('lib/responses.r')
source('lib/generate_plot_file.r')

p <- ggplot(
  within(referrals(),{
      Source <- factor(Source, levels=(Source[order(Unique.Pageviews)]))}),
  aes(x = Source, y = Unique.Pageviews,fill=Page))
p <- p + geom_bar()
p <- p + coord_flip()
p <- p + scale_y_continuous('\nVisitors to the Completion Page')
p <- p + scale_fill_brewer("Dark2",legend = FALSE)
p <- p + theme_bw()

generate_plot_file(p,'response_sources.png')

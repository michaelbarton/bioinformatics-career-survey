#!/usr/bin/env Rscript

library(ggplot2)
library(RColorBrewer)
source('lib/responses.r')
source('lib/colors.r')
source('lib/generate_plot_file.r')

p <- ggplot(
  within(completions(),{
      Country <- factor(Country, levels=(Country[order(Unique.Pageviews)]))
      EPI_regions <- gsub("and the", "/", EPI_regions)
      EPI_regions <- gsub("and Caribbe", "", EPI_regions)
  }),
  aes(x = Country, y = Unique.Pageviews, fill = EPI_regions))
p <- p + geom_bar()
p <- p + coord_flip()
p <- p + scale_fill_manual('Region',(values = colors()))
p <- p + scale_y_continuous('\nVisitors to the Completion Page')
p <- p + theme_bw()

generate_plot_file(p,'responses_bar.png')

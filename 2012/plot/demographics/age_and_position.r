#!/usr/bin/env Rscript

library(ggplot2)

source('lib/survey.r')
source('lib/colors.r')
source('lib/generate_plot_file.r')

p <- ggplot(
  remove_missing(survey.2012()),
  aes( y = 2012 - birth.year, x = position))

p <- p + stat_boxplot()
p <- p + theme_bw()
p <- p + scale_x_discrete("")
p <- p + scale_y_continuous("Age")
p <- p + opts(legend.position = "top")
p <- p + opts(axis.text.x=theme_text(angle=-90, hjust=0))

generate_plot_file(p,'age_and_position.png',height=960)

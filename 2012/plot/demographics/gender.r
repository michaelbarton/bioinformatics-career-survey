#!/usr/bin/env Rscript

library(ggplot2)

source('lib/survey.r')
source('lib/colors.r')
source('lib/generate_plot_file.r')

p <- ggplot(
            subset(survey.2012(),gender == "Male" | gender == "Female"),
            aes(x = gender,fill=gender))

p <- p + stat_bin()
p <- p + theme_bw()
p <- p + scale_x_discrete("Gender")
p <- p + scale_y_continuous("Total responses")
p <- p + scale_fill_manual("Gender",(values = colors()))
p <- p + opts(legend.position = "none") 

generate_plot_file(p,'gender.png')

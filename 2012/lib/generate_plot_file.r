generate_plot_file <- function(plot,file,height=480){
  png(file,width = 640,height = height,res=100)
  print(plot)
  dev.off()
}

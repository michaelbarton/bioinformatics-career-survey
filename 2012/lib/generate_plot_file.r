generate_plot_file <- function(plot,file){
  png(file,width = 640,height = 480,res=100)
  print(plot)
  dev.off()
}

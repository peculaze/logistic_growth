#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
exp(6.8941709)
(N0*K*exp(r*60))/(K-N0+N0*exp(r*60))

N0 <- 879 # Starting point from data, not model
N0 <- exp(6.8941709) # Starting point extrapolated from model
  
r <- 0.0100086 #
  
K <- 60000000000 #

ggplot(aes(t,N), data = growth_data) +
  
  geom_point(colour = "red") + 
  
  geom_function(fun=logistic_fun, colour="#e9f000") + 
  
  theme_classic() + 
  
  theme(plot.background = element_rect(fill = "#0E1116"), 
        panel.background = element_rect(fill = "#0E1116"), 
        axis.text = element_text(colour = "white"), 
        axis.title = element_text(colour = "white", face = "bold"), 
        axis.ticks = element_line(colour = "#eeeeee"), 
        axis.line.x = element_line(colour = "#eeeeee"),
        axis.line.y = element_line(colour = "#eeeeee")) + 
  
  labs(x="Time", y="Population Size")

  scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()

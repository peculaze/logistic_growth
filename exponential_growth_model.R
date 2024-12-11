
N0=986.5075
r=0.0100086
K=60000000000

# Population size predicted at t = 4980 under logistic growth: 

logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

logistic_fun(4980) # Outputs 6e+10 (carrying capacity)

# Population size predicted at t = 4980 under exponential growth: 

exponential_fun <- function(t) { 
  N <- N0*exp(r*t)
  return(N)
}


## Graph comparing exponential and logistic curves: 

library(ggpubr)

# Plot of exponential vs logistic growth

comparison.plot.basic <- ggplot(data.frame(t = c(0, 5000)), aes(x = t)) + 
  geom_function(fun = logistic_fun, aes(col = "Logistic"), lwd=1.1) + 
  geom_function(fun = exponential_fun, aes(col = "Exponential"),lwd=0.7) + 
  xlim(0,3000) + 
  ylim(0,600000000000) + 
  labs(x="Time",y="Population Size") + 
  scale_colour_manual(values = c("#e9f000","#f06000")) +
  theme_classic() + 
  theme(plot.background = element_rect(fill = "#0E1116"), 
        panel.background = element_rect(fill = "#0E1116"), 
        axis.text = element_text(colour = "white"), 
        axis.title = element_text(colour = "white", face = "bold"), 
        axis.ticks = element_line(colour = "#eeeeee"), 
        axis.line.x = element_line(colour = "#eeeeee"),
        axis.line.y = element_line(colour = "#eeeeee"), 
        legend.background = element_rect(fill = "#0E1116"), 
        legend.text = element_text(colour = "white"), 
        legend.title = element_blank(), legend.position="bottom")

# Same but with log transform on population size. 

comparison.plot.log <- ggplot(data.frame(t = c(0, 5000)), aes(x = t)) + 
  geom_function(fun = logistic_fun, col = "#f06000", lwd=1.1) + 
  geom_function(fun = exponential_fun, col = "#e9f000", lwd=0.7) + 
  xlim(0,3000) + 
  ylim(0,600000000000) + 
  labs(x="Time",y="Population Size (log transform)") + 
  scale_y_continuous(trans='log10') + 
  theme_classic() + 
  theme(plot.background = element_rect(fill = "#0E1116"), 
        panel.background = element_rect(fill = "#0E1116"), 
        axis.text = element_text(colour = "white"), 
        axis.title = element_text(colour = "white", face = "bold"), 
        axis.ticks = element_line(colour = "#eeeeee"), 
        axis.line.x = element_line(colour = "#eeeeee"),
        axis.line.y = element_line(colour = "#eeeeee"))

# Combine plots using ggpubr package
ggarrange(comparison.plot.basic,comparison.plot.log, nrow = 1, 
          labels = c("a)","b)"), font.label = list(size = 12, color = "yellow"), 
          common.legend = TRUE, legend = "bottom") + bgcolor("#0E1116") 

sink(file = "package-versions.txt")
sessionInfo()
sink()

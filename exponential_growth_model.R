
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

exponential_fun(4980) # Outputs 4.37e+24


## Graph comparing exponential and logistic curves: 

library(gridExtra)

# Plot of exponential vs logistic growth

comparison.plot.basic <- ggplot(data.frame(t = c(0, 5000)), aes(x = t)) + 
  geom_function(fun = logistic_fun, colour = "#f08000", lwd=1) + 
  geom_function(fun = exponential_fun, colour = "#e9f000",lwd=0.8) + 
  xlim(0,3000) + 
  ylim(0,600000000000) + 
  labs(x="Time",y="Population Size") + 
  theme_classic() + 
  theme(plot.background = element_rect(fill = "#0E1116"), 
        panel.background = element_rect(fill = "#0E1116"), 
        axis.text = element_text(colour = "white"), 
        axis.title = element_text(colour = "white", face = "bold"), 
        axis.ticks = element_line(colour = "#eeeeee"), 
        axis.line.x = element_line(colour = "#eeeeee"),
        axis.line.y = element_line(colour = "#eeeeee"))

# Same but with log transform on population size. 

comparison.plot.log <- ggplot(data.frame(t = c(0, 5000)), aes(x = t)) + 
  geom_function(fun = logistic_fun, colour = "#f08000",lwd=1) + 
  geom_function(fun = exponential_fun, colour = "#e9f000",lwd=0.8) + 
  xlim(0,3000) + 
  ylim(0,500000000000) + 
  labs(x="Time",y="Population Size (visual log transform)") + 
  scale_y_continuous(trans='log10') + 
  theme_classic() + 
  theme(plot.background = element_rect(fill = "#0E1116"), 
        panel.background = element_rect(fill = "#0E1116"), 
        axis.text = element_text(colour = "white"), 
        axis.title = element_text(colour = "white", face = "bold"), 
        axis.ticks = element_line(colour = "#eeeeee"), 
        axis.line.x = element_line(colour = "#eeeeee"),
        axis.line.y = element_line(colour = "#eeeeee"))
        

comparison.plot.log

# Combine plots using gridExtra package
grid.arrange(comparison.plot.basic, comparison.plot.log, nrow=1, padding = 0)

?grid.arrange


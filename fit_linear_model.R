#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

plot(model1)
ggplot(data_subset1, aes(N_log, t)) + 
  geom_point() + 
  geom_smooth()

cor.test(data_subset1$N_log, data_subset1$t)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>2500)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

ggplot(data_subset2, aes(N, 1)) + 
  geom_point() + 
  geom_smooth()

ggplot(growth_data, aes(t, N)) + 
  geom_point() + 
  geom_smooth()

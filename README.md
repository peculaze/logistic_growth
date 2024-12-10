## HIII
### I Absolutely know what I'm doing B)

# Logistic Growth Analysis

A population of bacteria newly introduced into a nutrient medium are expected to undergo logistic growth, as described by the following differential equation, where N is the population size, r is growth rate, K is carrying capacity, and t is time. 

```math
\begin{equation}
\frac{dN}{dt} = N r (1 - \frac{N}{K})
\end{equation}
```

This model predicts an initial period of close to exponential expansion, followed by a reduction in growth rate to approximately 0 as the population reaches carrying capacity. The above equation can be rewritten with respect to N<sub>t</sub> as follows: 

```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```

To test this, a dataset was downloaded which originated from a simulated experiment of bacterial growth (available at https://osf.io/gm2hq/), and the logistic growth model was applied.##

## Results

To estimate N<sub>0</sub> and r, the logistic growth data was truncated to include only the section resembling exponential growth, a log transform was applied to N, and a linear model was fitted. The predictions of the intercept (after reversing the log transform) and slope were taken to be N<sub>0</sub> and r respectively. K was predicted by taking a section of the logistic curve starting after N had reached carrying capacity. The estimates are as follows: 

```math
\begin{equation}
N_0 = 986.5075
\end{equation}
```
```math
\begin{equation}
r = 0.0100086
\end{equation}
```
```math
\begin{equation}
K = 6.00*10^{10}
\end{equation}
```















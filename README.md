# Logistic Growth Analysis

A population of bacteria newly introduced into a nutrient medium is expected to undergo logistic growth, as described by the following differential equation, where N is the population size, r is growth rate, K is carrying capacity, and t is time. 

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

To test this, a dataset from a simulated experiment of bacterial growth was downloaded (available at https://osf.io/gm2hq/ as 'experiment.csv'), and the logistic growth model was mapped onto these datapoints.

## 1) Results

To estimate N<sub>0</sub> and r, the logistic growth data was truncated to include only the section resembling exponential growth, a log transform was applied to N, and a linear model was fitted. The predictions of the intercept (after reversing the log transform) and slope were taken to be N<sub>0</sub> and r respectively (the value of N<sub>0</sub> from the input dataset differs slightly from the value predicted under the linear model). K was predicted by taking a section of the logistic curve starting after N had reached carrying capacity. The estimates are as follows: 

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
##

<p align="center">
  <img src="https://github.com/user-attachments/assets/8653c1fc-f80e-4fb8-9b7f-67b53284008e">
</p>

***Fig. 1.** A plot showing the logistic growth model overlaid on datapoints from the simulated bacterial growth experiment from experiment.csv.*

## 2) Exponential Growth

Unlimited exponential growth can be described by the following function: 

```math
\begin{equation}
N(t) = N_0 e^{rt}
\end{equation}
```

Plugging 4980 into this equation as t, with N<sub>0</sub> = 986.5075 and r = 0.0100086 gives a value of **4.370846e+24**. This is many magnitudes higher than the population size predicted under logistic growth, which is 6.00e+10. A population of *E. coli* after this stretch of exponential growth would have comparable weight to the Great Wall of China (according to data from spurious internet sources, which suggest this weighs ~50,000,000 tonnes). By comparison, a population under logistic growth would weigh approximately a 20th of a gram. 

## 3) Plot Comparing Exponential and Logistic Growth

<p align="center">
  <img src="https://github.com/user-attachments/assets/c5d1fd25-088c-40e3-a315-7b38e58321a4")
>
</p>

***Fig. 2.** a) A plot showing the different growth patterns between a population undergoing exponential growth (yellow) vs a population undergoing logistic growth (orange). b) The same plot, with a log-transformed y axis to display the full exponential curve. See `exponential_growth_model.R` for the code producing this plot*















### Example of neural ODE vs. discrete layers

## Libraries
library(tidyverse)
require(gridExtra)

## Plotting DE Layers
x = seq(0, 3, 0.001)
de_hidden <- data.frame(x = x, y = 1/(1 + exp(-x))) %>% 
  ggplot(aes(x = x, y = y)) +
  geom_line() +
  theme_bw() +
  labs(x = "t \n(depth)", y = "h(t)") +
  ggtitle("Differential Equation Defining the \nHidden Activations for a Neural Network") +
  theme(plot.title = element_text(hjust = 0.5))
  
## Plotting recurrent NN Layers
disc_hidden <- data.frame(x = x, y = 1/(1 + exp(-x))) %>% 
  ggplot(aes(x = x, y = )) +
  geom_segment(aes(x = 0, y = 0, xend = 1, yend = 0.75)) + 
  geom_segment(aes(x = 1, y = 0.75, xend = 2, yend = 0.9)) +
  geom_segment(aes(x = 2, y = 0.9, xend = 3, yend = 0.97)) +
  theme_bw() +
  labs(x = "t \n(depth)", y = "h(t)") +
  ggtitle("Discrete Hidden Layers Defining the \nHidden Activations for a Neural Network") +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_point(aes(x = 0, y = 0), color = "red", size = 2) +
  geom_point(aes(x = 1, y = 0.75), color = "red", size = 2) +
  geom_point(aes(x = 2, y = 0.9), color = "red", size = 2) +
  geom_point(aes(x = 3, y = 0.97), color = "red", size = 2)

## Plotting together
grid.arrange(disc_hidden, de_hidden, ncol = 2)

### Residual vs. Recurrent Error Rate Plot

## Libraries
library(tidyverse)

## Plotting
ggplot(data = data.frame(x = 1:125, y = c(1/((1:70)), 1/((70)) + 0.0001*((1:55)^2))),
       aes(x = x, y = y)) +
  geom_line(size = 1.25, color = "red") +
  theme_bw() +
  labs(x = "Number of Layers", y = "Training Error Rate") + 
  geom_line(data = data.frame(x = 1:125, y = c(1.1/((1:125)))),
            aes(x = x, y = y), color = "blue", size = 1.25) +
  ggtitle("Theoretical v. Actual Error Rates\n Plain Neural Network") +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_label(data = data.frame(x = 100, 
                               y = 1,
                               state = c("Blue Curve = Theoretical Error\nRed Curve = Error in Practice")),
             aes(x = x, y = y, label = state),
             nudge_y = -0.5)

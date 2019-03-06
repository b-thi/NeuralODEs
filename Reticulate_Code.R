### Learning to use reticulate

# R libraries
library(reticulate)
library(tidyverse)
library(reticulate)
library(tensorflow)
library(keras)
py_config()

# Python libraries
test = import("numpy")


# Looking at directory in R using os
os <- import("os")
os$listdir(".")

repl_python()

import pandas as pd
import torch

crime = pd.read_csv("Crime.csv", encoding='utf-8') 

crime.head()

exit
# 

ggplot(py$data, aes(x = year, y = wloc)) + geom_point()
py$crime
py$data[1]

### Reticulate NN

# R libraries
library(reticulate)
library(tidyverse)

# Looking at python version
py_config()

## RUNNING PYTHON IN R
repl_python() ########
## RUNNING PYTHON IN R

## Libraries 
import pandas as pd
import numpy as np
import os

## Activation Functions
def sigmoid(x):
  return 1.0/(1+ np.exp(-x))

def sigmoid_derivative(x):
  return x * (1.0 - x)

## Setting up Neural Net
class NeuralNetwork:
  
  def __init__(self, x, y):
    self.input      = x
    self.weights1   = np.random.rand(self.input.shape[1],4) 
    self.weights2   = np.random.rand(4,1)                 
    self.y          = y
    self.output     = np.zeros(y.shape)
    
  def feedforward(self):
    self.layer1 = sigmoid(np.dot(self.input, self.weights1))
    self.output = sigmoid(np.dot(self.layer1, self.weights2))
    
  def backprop(self):
    d_weights2 = np.dot(self.layer1.T, (2*(self.y - self.output) * sigmoid_derivative(self.output)))
    d_weights1 = np.dot(self.input.T,  (np.dot(2*(self.y - self.output) * sigmoid_derivative(self.output), self.weights2.T) * sigmoid_derivative(self.layer1)))
    self.weights1 += d_weights1
    self.weights2 += d_weights2


## Running Neural Net
if __name__ == "__main__":
  X = np.array([[0,0,1],
                [0,1,1],
                [1,0,1],
                [1,1,1]])
  y = np.array([[0],[1],[1],[0]])
  nn = NeuralNetwork(X,y)
  for i in range(1500):
    nn.feedforward()
    nn.backprop()
    
  print(nn.output)
  exit

# Output
test = nn.output

# Saving to csv
test_frame = pd.DataFrame(test, columns=['Activations']) 
test_frame.to_csv('activations.csv')

## EXITING PYTHON IN R
exit #################
## EXITING PYTHON IN R

## Reading back saved code
nums = read.csv("activations.csv", header = T)
py$test_frame
plot(1:4, nums$Activations)

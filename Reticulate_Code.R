### Learning to use reticulate

# R libraries
library(reticulate)
library(tidyverse)

# Looking at python version
py_config()

# Python libraries
test = import("numpy")

# Looking at directory in R using os
os <- import("os")
os$listdir(".")


## RUNNING PYTHON IN R
repl_python()

## Libraries 
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt   #Data visualisation libraries 
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

## Setting wd
from os import chdir, getcwd
wd = getcwd()
chdir(wd)

## Reading in data
USAhousing = pd.read_csv('USA_Housing.csv')

## Looking at data
USAhousing.head()
USAhousing.info()
USAhousing.describe()
USAhousing.columns

## Looking at pairs plot
sns.pairplot(USAhousing)

## Looking at distribution of Price
sns.distplot(USAhousing['Price'])

## Looking at correlations
USAhousing.corr()

## Splitting into response and predictors
X = USAhousing[['Avg. Area Income', 'Avg. Area House Age', 'Avg. Area Number of Rooms',
                'Avg. Area Number of Bedrooms', 'Area Population']]
y = USAhousing['Price']

## Splitting in to test and train
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=101)

## Running regression
lm = LinearRegression()
lm.fit(X_train,y_train)

## Predictions
predictions = lm.predict(X_test)

## Looking at predictions vs. actual
plt.scatter(y_test,predictions)

exit
## EXITING PYTHON IN R

ggplot(py$data, aes(x = year, y = wloc)) + geom_point()

py$USAhousing
py$crime
py$data[1]

import csv
import os
import pandas as pd
import numpy as np

#read the csv file and further refer to it as data
file = open(os.path.join("data/raw/used_cars", 'used_cars_2cities.csv'), 'r')
data = csv.reader(file)

#the first row is column names do need to skip it for further steps
next(data)

#create a dictionary to store what kind of conditions are present among the cars and how many of each condition there are
condition_dict = {}
for column in data:
  if column[5] in condition_dict:
    condition_dict[column[5]] += 1
  else:
    condition_dict[column[5]] = 1
print(condition_dict)
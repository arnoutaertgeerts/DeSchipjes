__author__ = 'arnout'

from modelicares import SimRes, SimResList
import matplotlib.pyplot as plt
import numpy as np

data = SimResList('../Results/*year-occ*')

load_name = 'buildingTest.heatingSystem.QHeaSys'
# Equi-distant time vector
points = 31556926 / (60*5)
t = np.linspace(0, (60*5)*points, points)
# Get the powers at times t
load = data[load_name].values(t)
__author__ = 'u0098668'

import modelicares as mod
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from multiprocessing import Process, freeze_support

simulators = mod.simulators

house1 = "../Dymosims/Haarhakker"
house2 = "../Dymosims/Peterslei"

results_dir = "Results"
StopTime=31556#926

if __name__ == '__main__':
    freeze_support()
    with simulators.dymosim(results_dir=results_dir, StopTime=StopTime) as simulator:
        print 'Running simulations...'
        for i in range(11):
            sim = simulator.run(house2)
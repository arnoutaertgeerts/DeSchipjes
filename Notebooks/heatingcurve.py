__author__ = 'u0098668'

import modelicares as mod
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from multiprocessing import Process, freeze_support

simulators = mod.simulators

model = "../Dymosims/IdealLT"
testModel = "C:\Users\u0098668\Documents\Modelica\DeSchipjes\Dymosims/ChuaCircuit"

results_dir = "Results"
StopTime = 2500

if __name__ == '__main__':
    freeze_support()
    with simulators.dymosim(results_dir=results_dir, StopTime=StopTime) as simulator:
        sim = simulator.run(testModel)
        sim.wait()
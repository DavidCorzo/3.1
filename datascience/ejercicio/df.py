from numpy.core.fromnumeric import std
from numpy.lib.function_base import average
import pandas as pd
from statistics import stdev 
import matplotlib.pyplot as plt

UNIT_PRICE = 8
DATES = 0

dataframe = pd.read_csv("./FuelSalesDataSample.csv")

# # print(dataframe)

# siteid_6601 = dataframe.query("SiteID == 6601 and Grade == 'REGULAR'").values
# # print(stdev([x[UNIT_PRICE] for x in siteid_6601]))

# plot_graph = dict()
# for i in siteid_6601:
#     plot_graph.update({i[0]: list()})

# for i in siteid_6601:
#     plot_graph[i[0]].append(float(i[10][1:]))

# for i in plot_graph.keys():
#     plot_graph[i] = average(plot_graph[i])

# plt.plot(plot_graph.keys(), plot_graph.values())
# plt.show()
# plt.close()

# WEEKDAY, VOLUMES = 1, 8
# df = dataframe.values
# plot_volume = {1:[], 2:[], 3:[], 4:[], 5:[], 6:[], 7:[]}
# for i in df:
#     plot_volume[int(i[WEEKDAY])].append(i[VOLUMES])

# for i in plot_volume:
#     plot_volume[i] = average(plot_volume[i])

# plt.bar(plot_volume.keys(), plot_volume.values())
# plt.show()
# plt.close()

SITENAME = 4
PAYMENT_TYPE = 9
dataframe = dataframe.values

sitenames = dict()
for i in dataframe:
    sitenames.update({i[SITENAME]:0})

for i in dataframe:
    if (i[PAYMENT_TYPE] == "DRIVE OFF"):
        sitenames[i[SITENAME]] += 1

plt.bar(sitenames.keys(), sitenames.values())
plt.xticks(rotation=90)
plt.show()
plt.close()

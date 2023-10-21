#2A. In Python

import socket
print(socket.gethostname())

#3.

import pandas as pd
df = pd.read_csv('/anvil/projects/tdm/data/flights/subset/1991.csv')
df[df["Month"]==12].head() # see information about a few of the flights from December 1991

#4A. In Python

mem = 256000 #Memory in Anvil subcluster A in GB
gb_to_b = 1000000000 #Conversion factor from GB to Bytes
gb_to_tb = 1000 #Conversion factor from GB to TB

memb = str(mem * gb_to_b)
memtb = str(mem / gb_to_tb)

print("The memory of Anvil subcluster A is " + memb + " bytes.")
print("The memory of Anvil subcluster A is " + memtb + " terabytes.")
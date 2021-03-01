import random, statistics, matplotlib.pyplot as plt
# lista de 100 nums aleatorios
r = [random.randint(1,100) for i in range(1,100)]
# promedio
print(sum(r)/len(r))
# desviacion estandar.
print(statistics.stdev(r))
# graficar
plt.hist(r, bins='auto')  
plt.title("Histogram")
plt.show()
plt.savefig('img.png')


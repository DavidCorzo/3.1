# coeficientes de la función objectivo FO
# pido si estoy maximizando o minimizando
# Cantidad de restricciones.
# Coheficientes de restricciones. Matriz de r*c
# Determinar cantidad de puntos de interés: r*c-#ceros+Comb(#restriccioes, 2)
# determinar cuales del inciso 5 cumplen todas las restricciones.
# verificar el valor de cada candidato en la funcion objetivo.
# De los valores funcionales, quedarme con el máximo o mínimo según sea el case.

from math import 

# n!/(n-k)!
def main():
    c_fo = (input("Coheficientes de la función: ")).split(',')
    c_fo = [float(x) for x in c_fo]
    c = len(c_fo)

    maximization = int(input("Maximización? "))

    r = int(input("Cantidad de restricciones: "))

    numero_de_ceros = 0
    for i in c_fo: 
        for ii in i: if (ii == 0): numero_de_ceros += 1
    puntos_de_interes = r * c - (numero_de_ceros) + 
    

if __name__ == "__main__":
    print(main())

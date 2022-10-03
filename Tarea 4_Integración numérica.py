import math

def f(x):
    #f = math.exp(x**2) 
    #f = 1 + math.exp(-x)*math.sin(4*x)
    #f = math.sin(math.pi*x)
    #f = 1+(math.exp(-x))*math.cos(4*x)
    f = math.sin(math.sqrt(x))
    return f

def simpson38(a,b,n):
    h = (b-a)/n
    S = f(a) + f(b)
    for i in range(1,n):
        k = a + i*h
        if i%3 == 0:
            S = S + 2*f(k)
        else:
            S = S + 3*f(k)
    S = S*(3*h/8)
    return S

def main():
    a = float(input("Introduzca límite inferior de integración (a): \t"))
    b = float(input("Introduzca límite superior de integración (b): \t"))
    n = int(input("Número de subdivisiones (n): \t\t\t"))
    print("------------------------------------------")
    S = simpson38(a,b,n)
    print("Valor de integración numérica por Simpson 3/8: \t %0.14f" % (S))

main()


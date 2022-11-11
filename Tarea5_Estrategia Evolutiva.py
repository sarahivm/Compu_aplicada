import numpy as np
import math
from random import random
from random import gauss
from matplotlib import pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D

def f(x1, x2, x3):
    f = x1 + 2*x2 + x2*x3 - x1**2 - x2**2 - x3**2 
    #f = x**2+y**2
    return f

def surface():
    x = np.arange(-2, 2, 0.01) #variable x
    y = np.arange(-2, 2, 0.01) #variable y
    #Complete for a matrix named "surf"
    s = len(x),len(y)  #tamaño de la matriz
    surf = np.zeros(s)  #crear superficie (surface) vacía (inicia en ceros) de tamaño s (x,y)
    for j in range(len(y)):
        for i in range(len(x)):
            surf[i,j] = f(x[i],y[j])
    X, Y = np.meshgrid(x, y) #mesh grid x,y
    Z = np.array(surf) #matrix (list of lists) to array

    plt.figure(1)
    ax = plt.axes(projection = '3d')  #ax definition
    #Select one of three plot options:
    #ax.contour3D(x,y,surf,50,cmap="plasma")
    #ax.plot_wireframe(X, Y, Z, color='black')
    ax.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap='inferno', edgecolor='none')
     
    #labeling
    ax.set_xlabel("x")
    ax.set_ylabel("y")
    ax.set_zlabel('z')
    #plt.plot(-0.089, 0.71, 'gx')
    #plt.plot(0.089, -0.71, 'gx')
    plt.title('Función Objetivo');
 
def path(u,v,w):
    plt.figure(2)
    plt.plot(u[0], v[0], w[0],'b^')
    plt.text(u[0], v[0], w[0],'(x10,x20,x30)')
    for i in range(0, len(u)-1):
        plt.plot([u[i],u[i+1]], [v[i],v[i+1]], [w[i],w[i+1]],'r+-')

    plt.plot(u[-1], v[-1], w[-1],'bs')
    plt.text(u[-1], v[-1], w[-1],'(x1f,x2f,x3f)')
    plt.plot(-0.089, 0.71, 'gx')
    plt.plot(0.089, -0.71, 'gx')
    plt.xlim([-2, 2])
    plt.ylim([-2, 2])
    plt.grid()
    plt.title('Estrategia Evolutiva EE 1+1');
    
def evol(u,v,w):
    plt.figure(3)
    plt.plot(u)
    plt.plot(v)
    plt.plot(w)
    plt.legend(('x1', 'x2', 'x3'))
    plt.ylim([-2, 2])
    
    plt.show()

def mutation(x,s):
    xn = x+s*gauss(0,1)
    while xn < -2 or xn > 2:
        xn = x+s*gauss(0,1)
    return xn

def sigma(s,g,m):
    ps = m/g
    c = 0.817
    if g%20 == 0:
    #if True:
        if ps > 0.2:
            s = s/c
        elif ps < 0.2:
            s = s*c
        else:
            s = s
    else:
        s = s
    return s
    
def main():
  
    x1min, x1max, x2min, x2max, x3min, x3max = [-2, 2, -2, 2, -2, 2]
    gmax = 500;           #máximo número de iteraciones
    m = 0;                 #número de mutaciones exitosas
    c = 0.817;
    x1 = 4*random()+x1min
    x2 = 4*random()+x2min
    x3 = 4*random()+x3min
    x10x20x30 = [round(x1,6), round(x2,6), round(x3,6)]
    print("x10,x20,x30: ",x10x20x30)
    padre = f(x1, x2, x3)
    s = 1
    u = [x1]
    v = [x2]
    w = [x3]

    for g in range(1,gmax):
        x1n = mutation(x1,s)
        x2n = mutation(x2,s)
        x3n = mutation(x3,s)
        hijo = f(x1n,x2n,x3n)
        if hijo > padre:
            x1 = x1n
            x2 = x2n
            x3 = x3n
            m += 1               #mutación exitosa
            padre = f(x1,x2,x3)
        else:
            x1 = x1
            x2 = x2
            x3 = x3
            m = m
        s = sigma(s,g,m)
        u.append(x1)
        v.append(x2)
        w.append(x3)
        
    x1fx2fx3f = [round(x1,6), round(x2,6), round(x3,6)]
    print("x1f,x2f,x3f: ",x1fx2fx3f)
    #print("u: ",u)
    #print("v: ",v)
    #surface()
    #path(u,v,w)
    evol(u,v,w)
    
main()
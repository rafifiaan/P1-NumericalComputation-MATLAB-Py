import numpy as np
import matplotlib.pyplot as plt

print("Metode Bolzano - Numerical Computation")
print("-----------------------------------------")
persamaan = input("Masukkan Persamaan fungsi x : ")
a = float(input("Masukkan nilai a : "))
b = float(input("Masukkan nilai b : "))
e = 1e-5
print("Akar persamaan dari fungsi x : ", persamaan, " dengan batas bawah : ", a, " dan batas atas : ", b)

def f(x):
    return eval(persamaan)

if f(a)*f(b)>0:
    print("Persamaan tidak memiliki akar")
    
else :
    print("n          a                b              x              f(a)            f(b)             f(x)")
    for i in range(0,300):
        x = (a+b)/2
        print(i+1, "\t", format(a,".5f"), "\t", format(b,".5f"), "\t", format(x, ".5f"), "\t", format(f(a),".5f"), "\t", format(f(b),".5f"), "\t", format(f(x),".5f"))
        
        if abs(f(x))<e:
            break
        elif f(a)*f(x)<0:
            b=x
        else:
            a=x
            
print("Akar persamaannya adalah = ", x)

x = np.linspace(-5,10,100)

fig = plt.figure()
ax = fig.add_subplot(1,1,1)
ax.spines['left'].set_position('center')
ax.spines['bottom'].set_position('zero')
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

plt.plot(x, f(x))
plt.grid()
plt.show()
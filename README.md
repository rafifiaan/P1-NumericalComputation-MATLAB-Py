# Practicum 1 - Numerical Computing

 Name           : Rafi Aliefian Putra Ramadhani        
 NRP            : 5025211234                          


## Source Code with MATLAB 
>Doing execution Bisection Method using MATLAB Language (Platform)
Source :
```R
% Input
% fungsi non linier yang didefinisikan dalam mfile f.m
% batas atas dan batas bawah
% galat toleransi
%
% Output
% iterasi, solusi dan galat
% 
% contoh
% x.^3-3*x+1
% Masukkan batas bawah :0
% Masukkan batas atas :5
% Masukkan galat Toleransi :0.0001

clear
clc
disp('   Metode Bolzano')
disp('             Tekan Enter untuk lanjut')
pause
clc

%% Input nilai interval dan galat
disp('x.^3-3*x+1')
a=input('Masukkan batas bawah :');
b=input('Masukkan batas atas :');
galat1=input('Masukkan galat Toleransi :');

%% Ganti fungsinya di bawah ini
f= @(x) x.^3-3*x+1;

%% Algoritma
init=[a,b];
ya=f(a) ;  %Nilai f(a)
yb=f(b);   %Nilai f(b)
iter=0;
xm1=a;
galat=abs((b-a)/b);

while ya*yb>0
    disp('Ingat f(a)*f(b)>0, berarti tidak ada akar dalam selang'),
    break,
end

fprintf('\n     iterasi       a            b            xm            f(xm)           Galat\n');
while galat>galat1
    iter=iter+1;
    xm=(a+b)/2;
    yxm=f(xm);
    a1=a;b1=b;    % Inisialisasi untuk Tampilan
    while yxm==0, break,
    end
        if ya*yxm<0
        b=xm;
        yb=yxm;
    else
        a=xm;
        ya=yxm;
        end
    galat=abs((xm-xm1)/xm);
    xm1=xm;
    fprintf('%10.0f   %6.10f   %6.10f   %6.10f    %6.10f   %6.10f\n',[iter;a1;b1;xm;yxm;galat])
end
fprintf('Akarnya adalah = %6.10f\n',xm)
xx=linspace(init(1),init(2),100);
yy=f(xx);

%% Plot kurva dan titik estimasi
figure(1)
plot(xx,yy)
hold on
scatter(xm1,f(xm1),'filled','p')
plot(xx,zeros(length(xx),1))
xlabel('x')
ylabel('f(x)')
legend('f(x)','akar persamaan','garis f(x)=0')
title(sprintf('Metode Bolzano - Akarnya adalah = %.8f', xm1))
```
Result :
![mt1](https://user-images.githubusercontent.com/91828276/196020410-31b0b064-9c0f-4051-ad59-548db48f98ee.png) 
</br>

## Source Code with Python
>Doing execution Bisection Method using Python Language (Online Compiler Platform)
Source :
```R
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
    for i in range(1,10):
        x = (a+b)/2
        print(i+1, "\t", format(a,".5f"), "\t", format(b,".5f"), "\t", format(x, ".5f"), "\t", format(f(a),".5f"), "\t", format(f(b),".5f"), "\t", format(f(x),".5f"))
        
        if abs(f(x))<e:
            break
        elif f(a)*f(x)<0:
            b=x
        else:
            a=x
            
print("Akar persamaannya adalah = ", a, " dan ", b)

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
```
Result :
![py1](https://user-images.githubusercontent.com/91828276/196020415-1dca852b-6eb9-45a4-b90e-794c49655a64.png)
</br>


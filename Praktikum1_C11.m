% Input
% fungsi non linier yang didefinisikan dalam mfile f.m
% batas atas dan batas bawah
% galat toleransi
%
% Output
% iterasi, solusi dan galat
% 
% contoh
% x^2-9*x+18=0
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
disp('10.^x-100+2.*x=0')
a=input('Masukkan batas bawah :');
b=input('Masukkan batas atas :');
galat1=input('Masukkan galat Toleransi :');

%% Ganti fungsinya di bawah ini
f= @(x) 10.^x-100+2.*x;

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
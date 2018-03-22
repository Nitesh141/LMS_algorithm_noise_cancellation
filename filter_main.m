clc;

N = 97;
tau = (N-1)/2;
wc = 1;
w2 = 2.5;
window = 'hann';        %choose the window from (rect/hann/hamm)
filter = 'lpf';         %choose the filter from (lpf/hpf/bpf/brf)
res = 0.01;
wres = -3.14:res:3.14;
syms w 
f = symfun(exp(-1i*w*tau),w);  
h = filter1(f, N, tau, wc, w2, filter, window);
len = length(wres);
Hw=zeros(1,len);
for i=1:len
    for n=0:(N-1)/2
    Hw(i)=Hw(i)+2*cos(((i-len/2)*2*3.14/len)*n)*h((N-1)/2-n+1);
    end
end
figure;
subplot(2,1,1);
stem(h);xlabel('n');ylabel('h(n)');
title('Impulse Response of Low Pass Filter using Hann window');
subplot(2,1,2);
plot(wres,Hw);xlabel('w');ylabel('H(w)');
title('Frequency response of LPF using Hann window');
            





 

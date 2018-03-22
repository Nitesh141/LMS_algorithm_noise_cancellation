function h = filter1(f, N, tau, wc, w2, filter, window)

a=0:N-1;
syms w
g = symfun(exp(1i*w*a),w);
h = int(f*g/(2*pi),-wc,wc);
                                                            %window selection
if(strcmp(window,'rect')==1)         % rectangular window
    k=ones(N,1);
elseif(strcmp(window,'hann')==1)     % hann window
    k=hann(N);
elseif(strcmp(window,'hamm')==1)     % hamming window
    k=hamming(N);
end
                                                            %filter selection and integrating
if(strcmp(filter,'lpf')==1)          %lpf integral
    y=(int(1/(2*pi)*f*g, -wc, wc));
elseif(strcmp(filter,'hpf')==1)      %hpf integral
    y1=(int(1/(2*pi)*f*g, -pi, -wc));
    y2=(int(1/(2*pi)*f*g, wc, pi));
    y=plus(y1,y2)
elseif(strcmp(filter,'bpf')==1)      %bpf integral
    y1=(int(1/(2*pi)*f*g, -w2, -wc));
    y2=(int(1/(2*pi)*f*g, wc, w2));
    y=plus(y1,y2);
elseif(strcmp(filter,'brf')==1)      %brf integral
    y1=(int(1/(2*pi)*f*exp(1i*w*a), -pi, -w2));
    y2=(int(1/(2*pi)*f*exp(1i*w*a), -wc, wc));
    y3=(int(1/(2*pi)*f*exp(1i*w*a), w2, pi));
    y=plus(y1,plus(y2,y3));
end
h1 = double(y);
h=h1.*k';
end
 

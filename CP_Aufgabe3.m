%% Assignment 3


%% part 1

clc,clear

n = 2;
N = 100;
Toleranz = 1e-6;
x = linspace(-20,20,N);
y = @(x)x.^n-2;
yWert = y(x);

for i = 1:(N-1)
    if yWert(i)*yWert(i+1)<0
        x1 = x(i);
        x2 = x(i+1);
        x3 = (x1+x2)/2;
        while 1
            if y(x1)*y(x3)<0
                x2 = x3;
                x3 = (x1+x3)/2;
            else
                x1 = x3;
                x3 = (x2+x3)/2;
            end
            if abs(y(x3))<Toleranz || abs(x1-x2)<Toleranz*abs(x1+x2)/2
                break
            end
        end
        fprintf('%.8f\n',x3);
    end
end

%% part 2

clc,clear

n = 2;
Toleranz = 1e-6;

syms x
y = @(x)x.^n-2;
Dy = eval(['@(x)' char(diff(y,x,1))]);

x_start = [0.3:0.1:2];

for i = 1:length(x_start)
    x0 = x_start(i);
    k = 0;
    
    while 1
    x1 = x0 - y(x0)/Dy(x0);
    k = k+1;
    if abs(y(x1))<Toleranz || abs(x1-x0)<Toleranz*abs(x1)
        break
    end
    x0 = x1;
    end
    
    Anzahl(i) = k;
end

bar(x_start,Anzahl)


% fprintf('%.8f\n',x1);








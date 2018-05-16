%% Assignment 2: Taylor series of sin(x)
% Yu Jiawei(586067)

%% Introduction
% According to its definition, the Taylor series of a sinusoidal function
% $f(x) = \sin(x)$ can be written as
%
% $$ f(x) = \sum_{k=0}^{\infty} \frac{f^{(k)}(0)}{k!}x^k = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} ... $$
% 
% Since the even terms in the series are equals to zero, we can substitute $k$ with $2n+1$ so that only odd terms will be taken into account.
%
% $$ f(x) = \sum_{n=0}^{\infty} \frac{(-1)^n}{(2n+1)!} x^{2n+1} $$
%
% In the following section, I will plot the polynomial aprroximations of $sin(x)$ with its degree from 1 to 16, which means the highest order $k$ in Taylor series will be 16, as well as the sin(x) curve itself.
% Note that the index $n$ does not represent the order of the taylor series (Relation: $k=2n+1$ ), so there will be only 8 polynomial curve in the graph.

%% Coding
clc,clear

N = 1000; % Number of data points
xr = linspace(0,20,N);
LegendInfo = cell(1,9); % Predefinition of cell to improve its loop-performance

for n = 1:8
    y = TaylorreiheSin(xr,2*n); % Return the values of taylor series of order 2n
    plot(xr,y)
    xlim([0,20])
    ylim([-3,3])
    LegendInfo{n} = ['n = ' num2str(n)]; % n stands only for for the index of the series
    hold on 
end

% Plot the curve of sin(x) for comperation
plot(xr,sin(xr),'--')
LegendInfo{9} = 'sin(x)';

title('Polynomial Approximation of sin(x)')
xlabel('x')
ylabel('f (x)')
legend(LegendInfo)
hold off
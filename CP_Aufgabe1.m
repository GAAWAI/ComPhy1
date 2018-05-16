%% Uebungsaufgabe 1: Graphische Darstellung fuer schraegen Wurf
% Jiawei Yu, Matrikelnummer: 586067

%% Physikalische Grundlagen
% Positionen des Steins in Abhaengigkeit von Zeit $t$ mit
% Anfangsgeschwindigkeit $v_0$
%
% $$ x(t) = v_0 cos(\alpha)t $$
% 
% $$ y(t) = h_0 + v_0 sin(\alpha) t - \frac{1}{2}gt^2 $$
%
% Setzt man jetzt die Zeit $t = \frac{x}{v_0 cos(\alpha)}$ in $y(t)$ ein,
% ergibt sich die $y$-Koordinaten als eine Funktion von $x$
%
% $$ y(x) = h_0 + x tan(\alpha) - \frac{g x^2}{2 v_0^2 cos(\alpha)^2} $$
%

%% Coding
% Initiating the data
clc,clear
v_0 = 10 + 10*rand();           % Anfangsgeschwindigkeit (m/s)
h_0 = 0.67;                     % Ausgangshoehe (m)
g = 9.81;                       % Erdgeschleunigung (m/s^2)
N = 1000;
x = linspace(0,50,N);
Winkel = [10:1:80].';
Wurfweite = zeros(length(Winkel),1);
k = 1;

% Plotting the Trajectory
for alpha = 10:1:80         % Angel from 10 to 80 with step in 1 degree
    y = h_0 + x*tand(alpha) - (g*x.^2)/(2*v_0^2*cosd(alpha)^2);
    % Finding the zero points
    for i=1:N-1
        if (y(i)*y(i+1)) < 0
            Wurfweite(k) = (x(i)+x(i+1)) / 2;
        end
    end
    k = k+1;
    plot(x,y)
    xlim([0,20]);
    ylim([-20,20]);
    hold on
end
xlabel('x(m)');
ylabel('y(m)');
hold off

% Presentation of the results
fprintf('Schraegen Wurf mit Anfangsgeschwindigkeit %2.2fm/s und Ausgangshoehe 0.67m\n',v_0)
T = table(Winkel,Wurfweite)


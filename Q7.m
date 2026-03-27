% Q7
clear; clc;

% H(z) = (z^-1 - 0.5)/(1 - 0.5z^-1)
b = [-0.5 1];
a = [1 -0.5];

% Pole-zero plot
figure;
zplane(b, a);
title('Pole-Zero Plot');
grid on;

% Group delay
figure;
grpdelay(b, a, 1024);
title('Group Delay');
grid on;

% Magnitude response 
figure;
freqz(b, a, 1024);
title('Magnitude & Phase Response');
grid on;

figs = findall(0,'Type','figure');   

for k = 1:numel(figs)
    f = figs(k);
    exportgraphics(f, sprintf('q7_%d.png', k), 'Resolution', 300);  
    savefig(f, sprintf('q7_%d.fig',  k));                            
end

% Q6(a)
clear; clc;

% H(z) = z / (z^2 - 1.5z + 0.5)
b = [0 1];          % numerator coefficients
a = [1 -1.5 0.5];   % denominator coefficients

[r, p, k] = residuez(b, a);

disp('Residues:');
disp(r);

disp('Poles:');
disp(p);

disp('Direct terms:');
disp(k);

% Q6(b)
clear; clc;

b = [0.5 0.5];   % moving average filter
a = [1];

figure;
freqz(b, a, 1024);
title('Frequency Response of 2-point Moving Average Filter');
grid on;

saveas(gcf, 'Q6', 'png');
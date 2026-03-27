% Q8
clear; clc;
[x, Fs] = audioread('voice.wav');

if size(x,2) > 1
    x = mean(x,2);
end

N = length(x);

% Original
Nfft = 2^nextpow2(N);
X = fftshift(fft(x, Nfft));
f = (-Nfft/2:Nfft/2-1)*(Fs/Nfft);

figure;
plot(f, abs(X));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Original Spectrum');
grid on;

sound(x, Fs);
pause(length(x)/Fs + 1);

% Downsampling
M = 4;
x_ds = x(1:M:end);
Fs_ds = Fs / M;

Nds = length(x_ds);
Nfft_ds = 2^nextpow2(Nds);
X_ds = fftshift(fft(x_ds, Nfft_ds));
f_ds = (-Nfft_ds/2:Nfft_ds/2-1)*(Fs_ds/Nfft_ds);

figure;
plot(f_ds, abs(X_ds));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Downsampled Spectrum (M = 4)');
grid on;

sound(x_ds, Fs_ds);
pause(length(x_ds)/Fs_ds + 1);

% Upsampling

L = 2;
x_us = zeros(L*N,1);
x_us(1:L:end) = x;
Fs_us = Fs * L;

Nus = length(x_us);
Nfft_us = 2^nextpow2(Nus);
X_us = fftshift(fft(x_us, Nfft_us));
f_us = (-Nfft_us/2:Nfft_us/2-1)*(Fs_us/Nfft_us);

figure;
plot(f_us, abs(X_us));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Upsampled Spectrum (L = 2)');
grid on;

sound(x_us, Fs_us);

figs = findall(0,'Type','figure');  

for k = 1:numel(figs)
    f = figs(k);
    exportgraphics(f, sprintf('q8_%d.png', k), 'Resolution', 300);   
    savefig(f, sprintf('q8_%d.fig',  k));                     
end

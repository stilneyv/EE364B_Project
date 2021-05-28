function snr = calc_snr(signal, noisy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noisy = double(noisy);
signal = double(signal);
EPS = 1e-8;

noise = (noisy-signal);
% noise(noise < EPS) = EPS;
% temp = signal./noise;
% snr = mean(temp, 'all');
% snr = 10*log10(snr);
bottom = var(noise,0,'all') + mean(noise,'all')^2;
top = var(signal,0,'all') + mean(signal,'all')^2;
snr = top/bottom;

end
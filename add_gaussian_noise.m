function noisy_img = add_gaussian_noise(orig_img, var)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
orig_img = double(orig_img);

[m, n] = size(orig_img);
mask = randn(m,n) * var;
noisy_img = mask + orig_img;
noisy_img(noisy_img > 255) = 255;
noisy_img(noisy_img < 0) = 0;

noisy_img = uint8(round(noisy_img));
end
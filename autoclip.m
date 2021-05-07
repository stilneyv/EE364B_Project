function clipped_img = autoclip(orig)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rad = 35; % 70x70 images seem to be the limit

[m,n] = size(orig);
clipped_img = img(floor(m/2)-rad:floor(m/2)+rad, ...
    floor(n/2)-rad:floor(n/2)+rad);

end
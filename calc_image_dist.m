function dist = calc_image_dist(orig, den)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
orig = double(orig);
den = double(den); 

dist = norm(orig(:) - den(:), 2)^2;

end
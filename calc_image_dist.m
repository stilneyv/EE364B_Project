function dist = calc_image_dist(orig, den)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
orig = double(orig);
den = double(den); 
orig = orig(:);
den = den(:);

dist = 0;
for i = 1:length(orig)
    dist = dist + norm([orig(i), den(i)]);
end


end
function dist = calc_image_dist(orig, den)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: calc_image_dist
% Use: calculates the image distance using the 
%      L2 norm. This method has been retired as
%      using SNR is a better absolute metric.
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
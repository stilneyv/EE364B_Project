function clipped_img = autoclip(orig)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: autoclip
% Use: autoclips an image to take the center 
%       region of a certain dim, given by rad
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rad = 35; % 70x70 images seem to be the limit

[m,n] = size(orig);
clipped_img = img(floor(m/2)-rad:floor(m/2)+rad, ...
    floor(n/2)-rad:floor(n/2)+rad);

end
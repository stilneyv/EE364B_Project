function [final_img, cvx_optval] = TV_l1_reg(noisy_img, lambda)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: TV_l1_reg
% Use: optimizes an image given a reg. constant
%      lambda using L1 reg. on the spatial grads
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noisy_img = double(noisy_img);
[n, d] = size(noisy_img);

cvx_begin
    variable final_img(n,d);
    grads_x = (final_img(1:n-1,1:d-1) - final_img(2:n,1:d-1));
    grads_y = (final_img(1:n-1,1:d-1) - final_img(1:n-1,2:d));
    grads = [grads_x(:); grads_y(:)];
    
    
    minimize pow_pos(norm(final_img(:) - noisy_img(:),2),2) + ...
        lambda*norm(grads,1);
cvx_end

final_img = uint8(round(final_img));
imwrite(noisy_img, 'ni.jpg');
imwrite(final_img, 'final_l1.jpg');

end
function [final_img, cvx_optval] = TV_l2_reg(noisy_img, lambda)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noisy_img = double(noisy_img);
[n, d] = size(noisy_img);

cvx_begin
    variable final_img(n,d);
    grads_x = (final_img(1:n-1,1:d-1) - final_img(2:n,1:d-1)).^2;
    grads_y = (final_img(1:n-1,1:d-1) - final_img(1:n-1,2:d)).^2;
    grads = (grads_x + grads_y);
%     grads = [grads_x(:); grads_y(:)];
    
    
    minimize pow_pos(norm(final_img(:) - noisy_img(:),2),2) + ...
        lambda*sum(grads(:))
%                 lambda*norm(grads,2);
cvx_end
imwrite(noisy_img, 'ni.jpg');
imwrite(final_img, 'final_l2_orig.jpg');

end
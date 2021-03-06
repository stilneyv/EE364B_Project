function [final_img, cvx_optval] = TV_l2_reg(noisy_img, lambda)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: TV_l2_reg
% Use: optimizes an image given a reg. constant
%      lambda using L2 reg. on the spatial grads
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noisy_img = double(noisy_img);
[n, d] = size(noisy_img);
D = d-1;

cvx_begin
    variable final_img(n,d);
    grads_x = (final_img(1:n-1,1:d-1) - final_img(2:n,1:d-1));
    grads_y = (final_img(1:n-1,1:d-1) - final_img(1:n-1,2:d));
    grads = cat(3, grads_x, grads_y);
%     grads(:,:,2)= grads_y;
%     term = zeros(n,d);
    for i = 1:n-1
        for j = 1:D
            g = grads(i, j, :);
            term(i,j) = norm(g(:),2);
        end
    end
%     grads = [grads_x(:); grads_y(:)];
    
    
    minimize pow_pos(norm(final_img(:) - noisy_img(:),2),2) + ...
        lambda*sum(term(:))
%                 lambda*norm(grads,2);
cvx_end

final_img = uint8(round(final_img));
imwrite(noisy_img, 'ni.jpg');
imwrite(final_img, 'final_l2_orig.jpg');

end
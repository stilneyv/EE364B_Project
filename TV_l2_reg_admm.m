function [final_img, cvx_optval] = TV_l2_reg_admm(noisy_img, lambda)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Method: add_gaussian_noise
% Use: Adds Gaussian noise with variance 'var' to 
%      an image of size m x n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noisy_img = double(noisy_img);
[n, d] = size(noisy_img);
D = d-1;

f = [+Inf]; fbest = [+Inf];
final_img = noisy_img;
Z = cat(3,final_img,final_img); % slack var
U = zeros(n,d,2); % augmented Lagrangian var
rho = 1;
k = 1;
EPS = 1e-3;

while k <= 1000
    
    % calc fval
    grads_x = (final_img(1:n-1,1:d-1) - final_img(2:n,1:d-1));
    grads_y = (final_img(1:n-1,1:d-1) - final_img(1:n-1,2:d));
    grads = [grads_x(:); grads_y(:)];
    for i = 1:size(grads,1)
        phi(i) = norm(grads(i,:),2);
    end
    fval = sum(norm(final_img(:) - noisy_img(:),2)) + lambda*sum(phi);
    f(end+1) = fval;
    fbest(end+1) = min( fval, fbest(end) );
    
    
    % admm updates
    % x
    final_img = (noisy_img + sum(U + rho*Z,3))/(1+2*rho);
    
    % z
    cvx_begin quiet
        variable z(n,d)
        grad = (z(1:n-1,1:d) - z(2:n,1:d));
        summ = sum(sum(abs(grad)));

        minimize 1/2*pow_pos(norm(z + 1/rho*U(:,:,1) - final_img, 'fro'),2) + ...
            lambda/rho*summ

    cvx_end
    Z(:,:,1) = z;
    clear grad; clear z;
    cvx_begin quiet
        variable z(n,d)
        grad = (z(1:n,1:d-1) - z(1:n,2:d));
        summ = sum(sum(abs(grad)));

        minimize 1/2*pow_pos(norm(z + 1/rho*U(:,:,2) - final_img, 'fro'),2) + ...
            lambda/rho*summ

    cvx_end
    Z(:,:,2) = z;
    
    % u
    for i = 1:2
        U(:,:,i) = U(:,:,i) + rho*(Z(:,:,i) - final_img);
    end
    
    % when to terminate?
    diff = final_img - mean(Z,3);
    disp(mean(abs(diff),'all'))
    if mean(abs(diff),'all') < EPS
        break;
    end
    
    k = k + 1;
    disp(fval);
end
    
% function summ = F(Z, i)
% if i == 1
%     grad = (Z(1:n-1,1:d-1) - Z(2:n,1:d-1));
% elseif i == 2
%     grad = (Z(1:n-1,1:d-1) - Z(1:n-1,2:d));
% end
% summ = sum(abs(grad),'all'); 
% end

final_img = uint8(final_img);

end
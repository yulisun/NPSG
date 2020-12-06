function dis_xy = distance_L2(patch_x,patch_y)
[~, ~, c] = size(patch_x);
dx_temp_vec = patch_x(:);
dy_temp_vec = patch_y(:);
dis_xy = norm(dx_temp_vec-dy_temp_vec,2)^2;
dis_xy =dis_xy/c;
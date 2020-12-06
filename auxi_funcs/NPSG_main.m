function [DI_fw, DI_bw] = NPSG_main(image_t1,image_t2,opt)
[H,W,~] = size(image_t1);
f_x_distance = zeros(H,W);
f_y_distance = zeros(H,W);
for i = 1:opt.delt_p:H
    for j = 1:opt.delt_p:W
        % patch_0: the target patch
        [x_location, y_location] = pixel_location(i,j,H,W,opt.p_s);
        patch_x0 = image_t1(x_location,y_location,:);
        patch_y0 = image_t2(x_location,y_location,:);
        % find the centre for all candidate neighbors
        [centre_x, centre_y]=find_centre(i,j,opt.w_s,opt.p_s,opt.delt_s,image_t1);  
        distance_fort1 =zeros(length(centre_x)*length(centre_y),1);
        distance_fort2 =zeros(length(centre_x)*length(centre_y),1);
        t=1;
        for t_x = 1:length(centre_x)
            for t_y = 1:length(centre_y)
                x = centre_x(t_x)-opt.p_s:centre_x(t_x)+opt.p_s;
                y = centre_y(t_y)-opt.p_s:centre_y(t_y)+opt.p_s;
                patch_t1 = image_t1(x,y,:);
                patch_t2 = image_t2(x,y,:);
                % for optical image
                distance_fort1(t) = distance_L2(patch_x0,patch_t1);
                % for SAR image, if we choose d_sar = [log(x/y)]^2, 
                % we can directly use L2 distance for log transformed images 
                distance_fort2(t) = distance_L2(patch_y0,patch_t2);
                t = t+1;
            end
        end
    K = min(opt.k,t-1);
    [value_t1, rank_t1] = sort(distance_fort1,'ascend');
    [value_t2, rank_t2] = sort(distance_fort2,'ascend');
    % f^x and f^y using distance criteria
    f_x_distance(i,j) = abs(mean(distance_fort1(rank_t2(1:K))) - mean(value_t1(1:K)));
    f_y_distance(i,j) = abs(mean(distance_fort2(rank_t1(1:K))) - mean(value_t2(1:K)));
    end
end
fprintf(['\n f^x and  f^y  are calculated......' '\n'])
DI_fw = zeros(H,W);
DI_bw = zeros(H,W);
for i = 1:H
    for j = 1:W
        local_i = local_position(i,opt.p_s,opt.delt_p,H);
        local_j = local_position(j,opt.p_s,opt.delt_p,W);
        DI_fw(i,j) = mean(mean(f_y_distance(local_i,local_j)));
        DI_bw(i,j) = mean(mean(f_x_distance(local_i,local_j)));
    end
end
fprintf(['\n Forward and backwar DIs  are calculated......' '\n'])
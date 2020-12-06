function local_i = local_position(i,p_s,delt_p,H)
if i<1+p_s
    local_i = 1:delt_p:(1+floor((i+p_s-1)/delt_p)*delt_p);
elseif i>H-p_s
    local_i = (1+ceil((i-p_s-1)/delt_p)*delt_p):delt_p:(1+floor((H-1)/delt_p)*delt_p);
else
    local_i = (1+ceil((i-p_s-1)/delt_p)*delt_p):delt_p:(1+floor((i+p_s-1)/delt_p)*delt_p);
end
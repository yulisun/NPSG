function [x, y]=find_centre(i,j,w_s,p_s,delt_s,image)
[H,W,~] = size(image);
t = floor((w_s-p_s)/delt_s);
if (i-t*delt_s-p_s)>0 && (i+t*delt_s+p_s)<(H+1)    
    x = i-t*delt_s:delt_s:i+t*delt_s;        
elseif (i-t*delt_s-p_s)<1
    temp_1 = floor((i-p_s-1)/delt_s);
    x = i-temp_1*delt_s:delt_s:i+t*delt_s; 
elseif (i+t*delt_s+p_s)>(H)
    temp_2 = floor((H-i-p_s)/delt_s);
    x = i-t*delt_s:delt_s:i+temp_2*delt_s;
else
    x=i;    
end
if (j-t*delt_s-p_s)>0 && (j+t*delt_s+p_s)<(W+1)
    y = j-t*delt_s:delt_s:j+t*delt_s;
    elseif (j-t*delt_s-p_s)<1
    temp_3 = floor((j-p_s-1)/delt_s);
    y = j-temp_3*delt_s:delt_s:j+t*delt_s; 
elseif (j+t*delt_s+p_s)>(W)
    temp_4 = floor((W-j-p_s)/delt_s);
    y = j-t*delt_s:delt_s:j+temp_4*delt_s;
else
    y=j;
end



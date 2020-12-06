function [x_location, y_location] = pixel_location(x,y,H,W,p_s)
x_location = [x-p_s:x+p_s];
y_location = [y-p_s:y+p_s];
if (x-p_s)<1
    x_location = [1:1+2*p_s];
end
if (y-p_s)<1
    y_location = [1:1+2*p_s];
end
if (x+p_s)>H
    x_location = [H-2*p_s:H];
end
if (y+p_s)>W
    y_location = [W-2*p_s:W];
end
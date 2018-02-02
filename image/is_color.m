function [bool, d]= is_color(im)
% is_color(im)
% determing if im is a color image
% OUTPUT: 
%         bool: true or false
%         d: average pixel difference between different channels

THRESHOLD = 2;

ch = size(im,3);
if ch == 1
    bool = false;
    d = 0;
    
elseif ch == 3
    
    row = size(im,1);
    col = size(im,2);
    d1 = im(:,:,1) - im(:,:,2);
    d2 = im(:,:,2) - im(:,:,3);
    d = ( sum(d1(:)) + sum(d2(:)) ) / 2 / (row * col);
    
    fprintf('%d\n', d);
    if  d < THRESHOLD
        bool = false;
    else
        bool = true;
    end
    
else
    bool = false;
    d = NaN;
    
end


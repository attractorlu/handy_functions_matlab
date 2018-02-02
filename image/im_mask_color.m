function [ mask ] = im_mask_color( im, color, dc )
% [ mask ] = im_mask_color( im, color, dc )
% get image mask by specify color 
%
% INPUT
% im: image
% c: color value
% dc: tolerance of color deviation 
%
% OUTPUT
% mask: 2d matrix of binary values


if nargin <3
    dc = 2;
end

if length(color)==1
    color = [color, color, color];
end

[row, col, ch] = size(im);

mask = true(row, col);
for i = 1:ch
    mask = mask & im(:,:,i) < color(i) + dc & im(:,:,i) > color(i) - dc;
end

end


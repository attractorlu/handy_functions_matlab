function imc = im_crop(im, rect, fillvalue)
% crop image, return rect region as specified, fill empty region 
% INPUT: im, image
%               rect: [xmin ymin width height]
% 

PAD_RATIO = 1.5;

if nargin<3
    fillvalue = 0;
end

yres = size(im,1);
xres = size(im,2);

size_max = ceil( max(yres, xres) * PAD_RATIO );
padsize = size_max - [yres xres];
im = padarray(im, padsize, fillvalue);

rect(1) = rect(1) + padsize(2);
rect(2) = rect(2) + padsize(1);

imc = imcrop(im, rect);

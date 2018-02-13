function [ im ] = im_replace_subregion( im, bg, mask)
% im  = im_replace_subregion( im, bg, mask)
% replace subregion of image with background 
% background will be scaled to the same size as image
%
% INPUT: 
%     im: image
%     bg: background
%     mask: binary array as same size of image, 
%                1 mark pixels to keep, 0 to replace


% sigma: sigma of Gaussian smooth in pixel
sigma = 10;

[y, x] = size(im(:,:,1));
bg = imresize(bg, [y x]);

im = im_mix(im, bg, mask, sigma);
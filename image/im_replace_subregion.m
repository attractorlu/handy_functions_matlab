function [ im ] = im_replace_subregion( im, bg, mask, sigma)
% im  = im_replace_subregion( im, bg, mask)
% replace subregion of image with background 
% background will be scaled to the same size as image
%
% INPUT: 
%     im: image
%     bg: background
%     mask: binary array as same size of image, 
%                1 mark pixels to keep, 0 to replace
%     sigma: sigma of Gaussian smooth in pixel

[y, x] = size(im(:,:,1));

if nargin<4
    sigma = y*0.05;
end


bg = imresize(bg, [y x]);

im = im_mix(im, bg, mask, sigma);
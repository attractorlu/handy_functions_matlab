function [ im ] = im_replace_subregion( im, bg, mask)
% im  = im_replace_subregion( im, bg, mask)
% replace subregion of image with background 
% INPUT: 
%     im: image
%     bg: background
%     mask: binary array as same size of image 


% sigma: sigma of Gaussian smooth in pixel
sigma = 10;

[y, x] = size(im(:,:,1));
bg = imresize(bg, [y x]);

% figure; imagesc(mask)
 
mask = double(mask);
mask = imgaussfilt(mask, sigma);

im = double(im);
bg = double(bg);
for i = 1:size(im,3)
    im(:,:,i) = (im(:,:,i)).* mask + (1-mask).*(bg(:,:,i));
end

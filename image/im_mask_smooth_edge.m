function [ im ] = im_mask_smooth_edge( im, mask, sigma)
% make smooth transition along mask edge
% to gray background 
% INPUT: 
%     im: image
%     mask: binary array as same size of image 
%                or polygon defined by sequence of points (n, 2)
%     sigma: sigma of Gaussian smooth in pixel
%

if nargin<3
    sigma = 10;
end

[y, x] = size(im(:,:,1));
[xx, yy] = meshgrid(1:x,1:y);

if ~islogical(mask)
    % if it's not bool, it should be a polygon.
    in  = inpolygon(xx(:), yy(:), mask(:,1), mask(:,2));
    mask = reshape(in, y, x);
end

% figure; imagesc(mask)
 
mask = double(mask);
mask = imgaussfilt(mask, sigma);

mask = (mask - 0.5)*2;
mask(mask<0 ) = 0;

% figure; imagesc(mask)


for i = 1:size(im,3)
    im(:,:,i) = double(im(:,:,i)).* mask + (1-mask)*128;
end


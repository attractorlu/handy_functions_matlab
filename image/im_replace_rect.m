function im = im_replace_rect(im1, rect, im2, mask)
% im_replace_rect(im1, rect, im2)
% replace rectangular subregion of image1 
% with masked image2, optional
% INPUT: rect, 4-element array [x y width height]
%


if all(rect<=1) % if normalized unit
    row = size(im1,1);
    col = size(im2,2);
    rect = uint32(round(rect .* [col row col row]));
else
    rect = uint32(round(rect));
end

ind1 = rect(2);
ind2 = rect(1);
s1 = rect(4);
s2 = rect(3);

im2 = imresize(im2, [s1 s2]);

if nargin==4
    mask = imresize(mask, [s1 s2]);
    im1_sub = im1(ind1:ind1+s1-1,ind2:ind2+s2-1,:);
    im2 = im_replace_subregion( im2, im1_sub, mask);
end

im = im1;
im(ind1:ind1+s1-1,ind2:ind2+s2-1,:) = im2;







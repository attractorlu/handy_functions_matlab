function im = histeq_masked(im, mask, hgram)
% perform masked histogram equalization for image
% im = histeq_masked(im, mask, hgram)

if nargin<3
    n = 64;
    hgram = ones(1,n)*(numel(im)/n);
end

if size(im,3)==3 
    % for color image
    hsv = rgb2hsv(im);
    v = hsv(:,:,3);
    v(mask) = histeq(v(mask), hgram);
    hsv(:,:,3) = v;
    im = hsv2rgb(hsv);
    
elseif size(im,3)==1
    im(mask) = histeq(im(mask), hgram);
    
end



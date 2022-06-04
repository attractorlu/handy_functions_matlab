function r2 = R2(data, prediction, dim)
% r2 = R2(data, prediction)
% compute R-squared

if nargin<3
    dim = 1;
end

SStotal = sum(bsxfun(@minus, data, mean(data,dim)).^2, dim);
SSerror = sum((data-prediction).^2, dim);
r2 = 1 - SSerror./SStotal;

end
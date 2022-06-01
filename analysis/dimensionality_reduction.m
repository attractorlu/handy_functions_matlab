function d = dimensionality_reduction(data, method, ndim)
% d = dimensionality_reduction(data)
% INPUT:
%    data (samples, dimensions)
% 
% OUTPUT:
%    d, dimension reduced data

if nargin<3
    ndim = size(data,2);
end

switch method
    case 'PCA'
        
        [eig_vector, score, eigenvalues] = pca(data, 'Centered', false);
        d = score;%(:,ndim);
        
    case 'MDS'
        
        D = pdist(data);
        d = mdscale(D, ndim);
%         d = mdscale(D, ndim, 'Start', 'random');

    case 't-SNE'
        
        d = tsne(data, [], ndim);
        
end
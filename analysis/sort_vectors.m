function index = sort_vectors(data, order)
% index = sort_vectors(data)
% sort row vectors
% 

switch order
    
    case {'PCA', 'PCAa', 'PCAd', 'PCA2'}
        [~, score] = pca(data);
        
        switch order
            case {'PCA', 'PCAa'}
                [~, index] = sort(score(:,1), 'ascend');
            case 'PCAd'
                [~, index] = sort(score(:,1), 'descend');
            case 'PCA2'
                [~, index] = sort(score(:,2), 'ascend');
        end
        
    case 'cluster'
        
        D = pdist(feature);
        tree = linkage(D);
        index = optimalleaforder(tree,D);
       
end
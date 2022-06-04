function pca_result = PCA_analysis( x,  center_x, method, ndim)
%PCA_ANALYSIS 
% pca_result = PCA_analysis( x,  center_x, method, ndim)
% INPUT x(sample, variable)
%              center_x: true or false
%              method: 'als'
%              ndim: number of PCs to be computed

if nargin<2
    center_x = false;
end

if nargin<3
    method = 'als';
end

n_sample = size(x,1);

if nargin<4
    ndim = n_sample;
end




if center_x
    pca_result.mean = mean(x);
    x = bsxfun(@minus, x, pca_result.mean); % center x
end

D = size(x, 2);

if D < 5000
    method = 'svd'; 
end


switch method
    case 'svd'
        
        % svd
        cov_mat = x'*x;
        [ pca_result.eig_vector, S ] = svd(cov_mat);  % column vector is eigenvector
        pca_result.eigenvalues = diag(S);
        pca_result.score = x * pca_result.eig_vector;
        
        %     [pca_result.eig_vector, pca_result.score, pca_result.eigenvalues, ~, pca_result.explained] ...
        %         = pca(x, 'Algorithm', 'svd', 'Centered', false);
        
        % figure;imagesc(pca_result.eig_vector(:,1:20));
        
        
    case 'rp'  % random projection
        
        % gen rand sparse matrix
        k = size(x, 1);
        D = size(x, 2);
        p = 1/sqrt(D)/2;
        R = rand(D,k);
        ind_minus = R<p;
        ind_plus = R>1-p;
        R(ind_minus) = -1;
        R(ind_plus) = 1;
        R( ~(ind_minus | ind_plus) ) = 0;
        
        %
        y = x*R;
        cov_mat = y'*y;
        [ U, S ] = svd(cov_mat);
        pca_result.eig_vector = R*U;
        pca_result.eig_vector = bsxfun(@rdivide, pca_result.eig_vector, sqrt(sum(pca_result.eig_vector.^2))); % normalize
        pca_result.eigenvalues = diag(S);
        pca_result.score = x * pca_result.eig_vector;
        
        % figure;imagesc(pca_result2.eig_vector(:,1:20));
        
        
    case 'als'
        
        % als
        opt = statset('pca');
        opt.Display = 'iter';
        opt.TolFun = 1e-5;
        opt.TolX = 1e-5;
        [pca_result.eig_vector, pca_result.score, pca_result.eigenvalues] ...
            = pca(x, 'Algorithm', 'als', 'Centered', false, 'NumComponents', ndim, 'Options', opt);
        
        % figure;imagesc(pca_result.eig_vector(:,1:20));
end



%

end


function [ cs ] = cosine_sim( a, b, dim )
% cosine similarity
if nargin<3
    dim = 1;
end
cs = sum(a.*b, dim)./ sqrt( sum(a.^2, dim) .* sum(b.^2, dim) );

end


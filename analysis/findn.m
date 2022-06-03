function ind = findn( data, data_to_find )
%findn 
n = length(data_to_find);
ind = nan(n,1);
for i=1:n
    k = find(data==data_to_find(i));
    ind(i) = k;
end

end


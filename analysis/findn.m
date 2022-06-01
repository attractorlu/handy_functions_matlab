function ind = findn( data, data_to_find )
%findn 
n = length(data_to_find);
ind = [];
for i=1:n
    k = find(data==data_to_find(i));
    ind = [ind k];
end

end


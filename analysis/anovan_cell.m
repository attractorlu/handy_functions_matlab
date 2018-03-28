function [ p, tbl, stats ] = anovan_cell( data )
% [p, tbl, stats] = anovan_cell( data )
% two-way analysis of variance, unbalanced design
% input 2D cell array of vector data


% build up data vector
y = [];
g1=[];
g2=[];

[row, col] = size(data);

for i = 1:row
    for j = 1:col
        
        data1 = data{i,j};
        y = [y; data1];
        g1 = [g1; zeros(size(data1))+i];
        g2 = [g2; zeros(size(data1))+j];
        
    end
end

[p, tbl, stats] = anovan(y, {g1,g2}, 'display','off');

end


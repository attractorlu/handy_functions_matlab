function [p, tbl, stats] = anova1_cell( data )
% p = anova1_cell( data )
% one-way analysis of variance
% input cell array of vector data

n = length(data);

y = [];
g = [];

for i = 1:n
    data1 = data{i};
    y = [y; data1];
    g = [g; zeros(size(data1))+i];
end
[p, tbl, stats] = anova1(y, g, 'off');

end


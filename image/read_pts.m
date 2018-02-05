function [ pts ] = read_pts( file )
% [ pts ] = read_pts( file )
% read .pts file
% .pts file example:
%    version: 1
%    n_points: 68
%    {
%    133.486 379.679
%    136.978 419.740
%    144.174 459.126
%    152.818 497.263
%    ...
%    }


fid = fopen( file );

npt = textscan(fid, 'n_points: %f', 1, 'HeaderLines', 1);
npt = cell2mat(npt);

pts = textscan(fid, '%f %f', npt, 'HeaderLines', 2);
pts = cell2mat(pts);

fclose(fid);

end


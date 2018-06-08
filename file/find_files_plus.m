function files = find_files_plus(folder, specs, subdir)
% find files of a set of extensions
% INPUT: folder
%              specs: cell array of a set of criterias
%              subdir: include subdir or not
% OUTPUT:
%     files: cell array of fullpath of files.
% example:  files = find_files_plus('.', {'*.bmp', '*.jpg'})

if nargin<3
    subdir = true;
end

files = [];
for i = 1:length(specs)
    
    files = [files;  find_files( fullfile(folder, specs{i}), subdir) ];  

end
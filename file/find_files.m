function files = find_files( filespec, subdir )
% files = find_files( filespec ) 
% For windows only
% INPUT: 
%     filespec: string of path+filename, e.g. '.\*.jpg'
%     subdir: true of false, include subdirectory or not
% OUTPUT:
%     files: cell array of fullpath of files.


if nargin<2
    subdir = true;
end

if ispc % windows
    
    command = ['dir "' filespec '" /B'];
    
    if subdir
        command = [command ' /S'];
    end
    
    [~, cmdout] = system(command);
    files = textscan(cmdout, '%s', 'Delimiter', '\n' );
    files = files{1};
    if strcmp(files{1}, 'File Not Found')
        files = cell(0);
    end
    
else
    error('not implemented for this system!');
end

end


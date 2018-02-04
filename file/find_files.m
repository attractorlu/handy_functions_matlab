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
    
    if strcmp(files{1}, 'File Not Found') ...
        || strcmp(files{1}, 'The system cannot find the file specified.')
    
        files = cell(0);
        
    elseif ~subdir % if no subdirectory, concatenate path
        filepath = fileparts(filespec);
        files = cellfun(@(x) fullfile(filepath, x), files,  'UniformOutput', false);
    end
    
else
    error('not implemented for this system!');
end

end


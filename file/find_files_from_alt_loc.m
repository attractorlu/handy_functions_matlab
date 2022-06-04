function files_alt = find_files_from_alt_loc(files, altpath)
% find files from alternative locations(files, altpath)

if ischar(files)
    files = {files};
end

if ischar(altpath)
    altpath = {altpath};
end

n = length(files);
m = length(altpath);

files_alt = cell(n,1);
for i=1:n
    [~, file, ext] = fileparts(files{i});
    for j=1:m
        tmp = find_files( fullfile(altpath{j}, [file, ext]) );
        if ~isempty(tmp)
            files_alt{j} = tmp{1};
            continue;
        end
    end

end

if n==1
    files_alt = files_alt{1};
end


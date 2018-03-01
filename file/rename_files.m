function rename_files(filespec, old_str, new_str)
% rename_files(filespec, old_str, new_str)
% Example: 
% rename_files('*.tif', 'RoomMate_', '') % delete string in all tif files

files = find_files(filespec);

for i=1:length(files)
    if isempty(strfind(files{i}, old_str))
        continue;
    end
    file_new = strrep(files{i}, old_str, new_str);
    movefile(files{i}, file_new)
end


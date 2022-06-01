function text_writer(filename, data)

fid = fopen(filename, 'w');

if ischar(data)
    fprintf(fid, '%s', data);
elseif iscell(data)
    fprintf(fid, '%s\n', data{:});
end

fclose(fid);
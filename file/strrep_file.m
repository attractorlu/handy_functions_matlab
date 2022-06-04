function strrep_file( filename, oldSubstr, newSubstr )
%STRREP_FILE 

% read file
fid = fopen(filename, 'r');
str = fread(fid, '*char');
fclose(fid);

% replace string
str_new = strrep(str', oldSubstr, newSubstr);

% write file
fid = fopen(filename, 'w');
fwrite(fid, str_new);
fclose(fid);

end


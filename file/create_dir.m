function create_dir(dir_path)
% create_dir(dir_path)

if ~exist(dir_path, 'dir')
    mkdir(dir_path)
end

end
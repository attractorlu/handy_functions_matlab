function files_batch_processing(input_files, operation)
%% files_batch_processing(input_files, operation)
% run function as specified by operation for each file
% e.g.: files_batch_processing('*.mp4',@mp42wav)

if ~isa(operation,'function_handle')
    error(message('files_batch_processing: operation is not a function handle'));
end

if ischar(input_files)
    files = find_files(input_files);
else
    files = input_files;
end

n = length(files);

for i = 1:n
    
    %% do it
    operation(files{i});

end




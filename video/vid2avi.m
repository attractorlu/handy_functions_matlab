function vid2avi( file_in, file_out, operation )
% video 2 avi  
% vid2avi( file_in, file_out, operation )
% operation: optional, function handle that operate on each image

if nargin<2
    file_out = [file_in(1:end-3) 'avi'];
    if strcmp(file_in, file_out)
        fprintf('no operation needed \n')
    end
end

if nargin<3
    is_operation = false;
elseif isa(operation, 'function_handle')
    is_operation = true;
else
    is_operation = false;
end

reader = VideoReader(file_in);
writer = VideoWriter(file_out);

open(writer);
while hasFrame(reader)
   img = readFrame(reader);
   if is_operation
       img = operation(img);
   end
   writeVideo(writer,img);
end
close(writer);

end


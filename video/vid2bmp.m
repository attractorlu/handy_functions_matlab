function vid2bmp(filename)
% vid2bmp(filename)

mv  = video_reader(filename);

filename_prefix = filename(1:end-4);

frames = size(mv,4);

for i = 1:frames
    bmp_filename = sprintf('%s_f%05d.bmp', filename_prefix, i);
    imwrite(mv(:,:,:,i), bmp_filename)
end

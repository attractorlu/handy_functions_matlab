function tif2avi( filename, framerate)
% tif2avi( filename)
% convert tif stack to avi

im = tif_reader(filename);
[pathstr, name] = fileparts(filename);
avi_filename = fullfile(pathstr, [name '.avi']);
video_writer(im, avi_filename, framerate)

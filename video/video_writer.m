function video_writer(mv, filename, frame_rate, profile)
% video_writer(mv, filename, frame_rate, profile)
% INPUT: 
%       mv, 4D array of movie (row, col, channel, frames)
%       profile, file format, optional, e.g. 'MPEG-4' or 'Uncompressed AVI'
%                   see help VideoWriter for more supported values
%

if nargin==4
    v = VideoWriter(filename, profile);
else
    v = VideoWriter(filename);
end

v.FrameRate = frame_rate;

open(v)

writeVideo(v,mv)

close(v)
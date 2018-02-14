function [mv, frame_rate] = video_reader(filename)
% [mv, frame_rate] = video_reader(filename)
% read video file
%  return 4D matrix of movie (row, col, channel, frames)

v = VideoReader( filename );

vidHeight = v.Height;
vidWidth = v.Width;
frame_rate = v.FrameRate;
s = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),...
    'colormap',[]);

k = 0;
while hasFrame(v)
    k = k+1;
    s(k).cdata = readFrame(v);
end

mv = cat(4,s.cdata);
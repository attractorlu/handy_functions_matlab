function vid2mp4( filename )
% vid2mp4( filename )
% convert video file to mp4

if strcmp(filename(end-2:end), 'mp4')
    fprintf('nothing to do \n')
    return
end

reader = VideoReader(filename);
outputfile = [filename(1:end-3) 'mp4'];
writer = VideoWriter(outputfile, 'MPEG-4');

open(writer);
while hasFrame(reader)
   img = readFrame(reader);
   writeVideo(writer,img);
end
close(writer);

end


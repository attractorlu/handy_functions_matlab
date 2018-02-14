function vid2gif( filename )
% vid2gif( filename )
% convert video file to gif

[mv, frame_rate] = video_reader(filename);

gifName = [filename(1:end-3) 'gif'];
mat2gif(gifName, mv, inf, 1/frame_rate );

end


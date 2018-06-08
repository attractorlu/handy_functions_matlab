function mat2vid( filename, mv, frame_rate )
% mat2vid( filename, mv, frame_rate )
% write matrix of a movie to a movie file.

% gray
if size(mv,4) == 1 || (size(mv,4) >= 1 && size(mv,3) == 1) 
    video_writer(mv, filename, frame_rate, 'Grayscale AVI')
        
% color
elseif size(mv, 4) >= 1 && size(mv,3) == 3 
    video_writer(mv, filename, frame_rate)
    
end

end


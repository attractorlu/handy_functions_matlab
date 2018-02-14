function mat2gif(filename, mv, loops, delay )
% mat2gif(filename, mv, loops, delay ) 
% write matrix of a movie to a gif file.
%
% INPUT: 
%              mv, movie 3D or 4D array
%              loops, number of repeats to play the animation
%              delay, delay time (sec) between the 
%                          display of each image in the animation
% 
% example: mat2gif('abc.gif', mv, Inf, 1/frame_rate)
%

if size(mv, 4) >= 1 && size(mv,3) == 3 % color
    for i = 1:size(mv,4)
        [A,map] = rgb2ind(mv(:,:,:,i), 256);
        if i == 1;
            imwrite(A,map,filename,'gif','LoopCount',loops,'DelayTime',delay);
        else
            imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',delay);
        end
        
    end
    
elseif size(mv,4) >= 1 && size(mv,3) == 1 % gray
    imwrite(mv, filename, 'gif', 'LoopCount', loops, 'DelayTime', delay);
    
else % assume 3D array of gray image with 3rd dimension to be time
    imwrite(permute(mv, [1 2 4 3]), filename, 'gif', 'LoopCount', loops, 'DelayTime', delay);
    
end

end


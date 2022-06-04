function video_audio_writer( filename, video, audio, format, frame_rate, audio_rate )
%% video_audio_writer( filename, video, audio, format, frame_rate, audio_rate )
% 

if nargin<3
    format = 'AVI';
end

if nargin<4
    frame_rate = 30;
end

if nargin<5
    audio_rate = 44100;
end

v = vision.VideoFileWriter(filename, 'AudioInputPort', true, ...
    'FileFormat', format, 'FrameRate', frame_rate);

nframe = size(video,4);
as = audio_rate/frame_rate; % audio_samples_per_frame

for i=1:nframe
    step(v, video(:,:,:,i), audio((i-1)*as + 1 : i*as , :));
end

release(v);


end


function audio2avi( filename )
%AUDIO2AVI 
% convert audio file to avi of gray background

frame_rate = 30;
background = 0.5;

%% read audio file
[y, Fs] = audioread(filename);
audio_samples = size(y,1);
nch = size(y,2);

%% create video
frames = ceil(audio_samples/Fs*frame_rate);
video = zeros(1,1,1,frames) + background;

%% concatenate zeros to audio signal 
% to be same length as video
n_samples_add = frames/frame_rate*Fs - audio_samples;
audio = [y; zeros(n_samples_add, nch)];

%% write video
video_filename = [filename(1:end-4) '.avi'];
video_audio_writer( video_filename, video, audio, 'AVI', frame_rate, Fs)

end


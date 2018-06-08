function mp42wav(filename)
% read audio from mp4 file and save it as .wav
output_name = [filename(1:end-4) '.wav'];
[y,Fs] = audioread(filename);
audiowrite(output_name,y,Fs)


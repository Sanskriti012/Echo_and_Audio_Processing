clc; clear all; close all;
rng(1);
% here i used the file path according to my laptop's download file path.
% Provid the file path of the WAV file
file_path ="C:\Users\sansk\Downloads\Audio1.wav";

% Read  the audio data and retrieve its properties
[audio,fs]= audioread(file_path);

% Display the sampling frequency and units
disp(['sampling frequency: ', num2str(fs), 'Hz']);
disp('Units; Amplitude');

% Play the audio using the 'sound' command
 sound(audio, fs);

% Define the echo parameters
A1= 0.7; % Echo coefficient for stage walls
A2= 0.7; % Echo coefficient for  back wall
A3= 0.7; %Echo coefficient for side walls
N1= round(fs * (8.575 / 343)); % Delay in samples for stage walls
N2= round(fs *(17.15/343));  % Delay in samples for back wall
N3= round(fs *(8.575 / 343)); % Delay in samples for side walls

% Generate the echo signal                                                                   
y = audio +A1 *[zeros(N1 ,1); audio(1:end -N1)] + A2 * [zeros(N2, 1); audio(1:end -N2)] + A3 *[zeros(N3, 1); audio(1:end -N3)];

% Play the echo Sugnal using the 'sound' command
sound(y,fs);

% Provide the file path of Audio1 and Audio2 WAV files
file_path_audio1 = "C:\Users\sansk\Downloads\Audio1.wav";
file_path_audio2 = "C:\Users\sansk\Downloads\Audio2.wav";

% Read the audio data
audio1 = audioread(file_path_audio1);
audio2 = audioread(file_path_audio2);

% Compute the autocorrelation funcions
autocorr1 = xcorr(audio1);
autocorr2 = xcorr(audio2);

% Plot the autocorrelation functions
figure(1);
subplot(2, 1, 2);
plot(autocorr1);
title('Autocorrelation of Audio1');

figure(2);
subplot(2 ,1 ,2);
plot(autocorr2);
title('Autocorrelation of Audio2');



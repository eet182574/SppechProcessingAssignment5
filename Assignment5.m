%% Assignment - 5
% Question: 06 Computer Assignment
% Prepared By: Parveen Bajaj, EET182574

%***************************************************************************************
clc, clear all, close('all');

%% Load the voice recorded file
speech_file = input('Enter speech file:', 's');
[speech,fs] = audioread(speech_file);

%% Display the signal
figure(1),plot([1:size(speech)]/fs,speech); 
title(speech_file);
ylabel('Amplitude');
xlabel('Time(sec)');

%% Resample the signal from 16 khz to 8 khz
resampled_speech = speech(1:2:end);
new_fs = fs/2;
figure,plot([1:size(resampled_speech)]/new_fs,resampled_speech);
title('Resampled Speech Signal at 8 KHz');
ylabel('Amplitude');
xlabel('Time(sec)');

%% Extract 04 frames of 22.5 msec (22.5 * 8 = 180 samples) from Voiced segments of recorded speech at 8 KHz
Frame1_Start = 91550;     % Digit 7 voiced segment
Frame2_Start = 102200;    % Digit 8 voiced segment
Frame3_Start = 49750;     % Digit 3 voiced segment
Frame4_Start = 62330;     % Digit 4 voiced segment

Frame1 = resampled_speech(Frame1_Start:Frame1_Start+180-1);   
Frame2 = resampled_speech(Frame2_Start:Frame2_Start+180-1);   
Frame3 = resampled_speech(Frame3_Start:Frame3_Start+180-1);
Frame4 = resampled_speech(Frame4_Start:Frame4_Start+180-1);


figure, plot(Frame1), title('Frame-1 extracted from Voiced segment of Digit 7');
figure, plot(Frame2), title('Frame-2 extracted from Voiced segment of Digit 8');
figure, plot(Frame3), title('Frame-3 extracted from Voiced segment of Digit 3');
figure, plot(Frame4), title('Frame-4 extracted from Voiced segment of Digit 4');


%% Mimicking LPC-10: Obtain the parameter values that are computed (and
% transmitted after quantization) by the LPC-l0 vocoder. Note that there is no need to
% quantize the parameters.


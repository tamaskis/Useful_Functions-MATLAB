%% EXAMPLES_waitbar.m
%
% Examples for using the "initialize_waitbar" and "update_waitbar"
% functions.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-06-04
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to folder with functions
addpath('../functions');



%% EXAMPLE

% initializes waitbar
[wb,prop] = initialize_waitbar('Running for loop...');

% number of iterations
N = 1000;

% runs through N iterations of a for loop, pausing 0.05 seconds at each
% iteration
for k = 1:N
    
    % pause
    pause(0.001);
    
    % update waitbar
    prop = update_waitbar(k,N,wb,prop);
    
end

% closes waitbar
close(wb);
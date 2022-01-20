If there is a file named "pathfile.m" in any of the folders, the command: addpath(genpath(fileparts(which('pathfile.m')))), will add all folders that are within the same directory of the pathfile as long as the pathfile.m is open within MATLAB's working directory.

Most files have the filetype" '.mlx' which is a MATLAB live script, this can be converted in MATLAB to a typical '.m' file.



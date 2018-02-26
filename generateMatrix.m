function [ filename1, filename2 ] = generateMatrix( n )
% generateMatrix creates a single matrix of integers of size nxn

%% Write
serial = regexprep(num2str(now), '[.-/]', '');
filename1 = strcat('measurements.',serial,'.txt');
filename2 = strcat('values.',serial,'.txt');
dlmwrite(filename1,rand(n));
dlmwrite(filename2,randi(10,n,1));
end



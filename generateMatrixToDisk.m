function [ filename1, filename2 ] = generateMatrixToDisk( n )
% generateMatrix creates a single matrix of integers of size nxn

%% Write
serial = regexprep(num2str(now), '[.-/]', '');
filename1 = strcat('measurements.',serial,'.txt');
filename2 = strcat('values.',serial,'.txt');
A = generateDiagonallyDominantMatrix(n);
b = randi(10,n,1)
dlmwrite(filename1,A);
dlmwrite(filename2,b);
end


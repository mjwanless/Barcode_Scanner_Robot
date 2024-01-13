
% Sanitize workspace
clc
close all
clear


% LUT = {'A',1331113;...
%        'B',1331113}
       

LUT = xlsread('ASCIIlookupdata');

%myArray =[3,1,3,1,1,3,1,1,1]
%myArray = string(myArray)


index = find(LUT == 113113113)
letter = char(LUT(index,2))

% disp(char(LUT(2,2)))
% Sanitize workspace:
clc
clear all
close all

% Three rules:
% 1. (row, col)
% 2. MATLAB counts from 1
% 3. start:stepsize:finish

% -----------------------------------------------------------------------------------
% a. Design and implement the moving average algorithm to filter the noisy light sensor values.

% Import and save data to variable
ImportedData = csvread('datalog-501.csv');

% Transpose for array input
ImportedData = ImportedData'

% Plot the graph
plot(ImportedData)

% This figures out a way to determine if data is above or below a particular threshold
DataSampleWidth = 15;
threshold = mean(ImportedData);

% Average over the data values, and clean up the data
for i = 1:1: length(ImportedData) - (DataSampleWidth-1)

    ImportedDataAverage(1, i) = sum(ImportedData(1, (i:1:i+(DataSampleWidth-1)))/ DataSampleWidth);

    if ImportedDataAverage(1, i) > threshold
        ImportedDataAverage(1, i) = 80;
    else
        ImportedDataAverage(1, i) = 20;
    end
end

% Plot another graph
subplot(3, 1, 1)

% Change the limit of the x axis
xlim([1, length(ImportedData)])

% Change the limit of the y axis
ylim([1, max(ImportedData)])

plot(ImportedData)

% Plot another graph
subplot(3, 1, 2)
plot(ImportedDataAverage, 'r')
xlim([1, length(ImportedDataAverage)])
ylim([1, max(ImportedDataAverage)])

% -----------------------------------------------------------------------------------
% b. Design and implement a finite difference algorithm to detect edges at black or white regions in the barcode.

% Now, we can calculate the derivative (This is really just a sample-to-sample, 1 width difference quotient)

for i = (1 : length(ImportedDataAverage) - 1)
    ImportedDataDerivative(i) = abs(ImportedDataAverage(i+1) - ImportedDataAverage(i));
end

subplot(3, 1, 3)
plot(ImportedDataDerivative, 'g')

grid minor
xlabel('Sample Number','FontSize',21)
ylabel('Colour Average','FontSize',21)


% -----------------------------------------------------------------------------------
% c. The built-in function "findpeaks" is used to identify the start and end indices (width) of each region in the barcode.

% Where are the peaks, and what indicies do they occur at
[peaks,peakLocations] = findpeaks(ImportedDataDerivative);

% Find the width of the peaks, against each other, in ratios
for (i = (1: length(peakLocations) - 1))
    BarcodeWidths(i) = (peakLocations(i + 1) - peakLocations(i));
end

peaks
BarcodeWidths
BarcodeWidths2 = round(BarcodeWidths / min(BarcodeWidths))
BarcodeWidthsNormalized= BarcodeWidths2(1,2:end)


% -----------------------------------------------------------------------------------
% d. Once the width and color of each barcode region are determined, a simple lookup table is designed to find the corresponding ASCII character.

% Since we, initially, had some technical issues, we used this to test .csv files
% 1 = 1
if BarcodeWidthsNormalized(1) == 1
    if BarcodeWidthsNormalized(2) == 1
        if BarcodeWidthsNormalized(3) == 1
            if BarcodeWidthsNormalized(5) == 1
                if BarcodeWidthsNormalized(6) == 1
                    charValue = 81;
                else
                    charValue = 71;
                end
            else
                if BarcodeWidthsNormalized(6) == 1
                    if BarcodeWidthsNormalized(7) == 1
                        charValue = 78;
                    else
                        charValue = 84;
                    end
                else
                    if BarcodeWidthsNormalized(7) == 1
                        charValue = 68;
                    else
                        charValue = 74;
                    end
                end
            end
        else
            if BarcodeWidthsNormalized(5) == 1
                if BarcodeWidthsNormalized(6) == 1
                    if BarcodeWidthsNormalized(7) == 1
                        charValue = 76;
                    else
                        charValue = 83;
                    end
                else
                    if BarcodeWidthsNormalized(7) == 1
                        charValue = 66;
                    else
                        charValue = 73;
                    end
                end
            else
                if BarcodeWidthsNormalized(6) == 1
                    charValue = 80;
                else
                    charValue = 70;
                end
            end
        end
    else
        if BarcodeWidthsNormalized(3) == 1
            charValue = 88;
        else
            if BarcodeWidthsNormalized(5) == 1
                charValue = 86;
            else
                charValue = 90;
            end
        end
    end
else
    if BarcodeWidthsNormalized(2) == 1
        if BarcodeWidthsNormalized(3) == 1
            if BarcodeWidthsNormalized(5) == 1
                if BarcodeWidthsNormalized(6) == 1
                    if BarcodeWidthsNormalized(7) == 1
                        charValue = 75;
                    else
                        charValue = 82;
                    end
                else
                    if BarcodeWidthsNormalized(7) == 1
                        charValue = 65;
                    else
                        charValue = 72;
                    end
                end
            else
                if BarcodeWidthsNormalized(6) == 1
                    charValue = 79;
                else
                    charValue = 69;
                end
            end
        else
            if BarcodeWidthsNormalized(6) == 1
                charValue = 77;
            else
                charValue = 67;
            end
        end
    else
        if BarcodeWidthsNormalized(3) == 1
            if BarcodeWidthsNormalized(5) == 1
                charValue = 85;
            else
                charValue = 89;
            end
        else
            charValue = 87;
        end
    end
end

char(charValue)

% -----------------------------------------------------------------------------------
% e. The ASCII character is displayed in the MATLAB command window.






















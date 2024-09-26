function [dB6RangeStart, dB6RangeEnd] = dBDrop(dataMatrix)
% This function finds the range where the signal amplitude is within a 6dB drop from the peak
    % amplitude in a given data matrix.
    %
    % Inputs:
    % dataMatrix - A 2D matrix of signal amplitudes
    %
    % Outputs:
    % dB6RangeStart - The start index of the 6dB drop range
    % dB6RangeEnd - The end index of the 6dB drop range

    % Find the overall maximum amplitude in the data matrix
    maxAmplitude = max(dataMatrix(:));
    
    % Calculate the amplitude value that corresponds to a 6dB drop.
    % A 6dB drop is equivalent to a reduction to half the power, which corresponds to the square root of 2
    dB6Amplitude = maxAmplitude * (1/sqrt(2));
    
    % Find where in the matrix these values occur. For simplicity, this example treats the matrix as a 1D vector.
    % You might need to adjust this to suit how your data is structured or to focus on specific regions.
    indicesWithin6dB = find(dataMatrix >= dB6Amplitude);
    
    % Convert indices to subscripts to find the range. This example assumes a single contiguous region.
    % For multiple regions or more complex scenarios, additional logic will be required.
    [rows, cols] = ind2sub(size(dataMatrix), indicesWithin6dB);
    
    % Determine the start and end of the range in terms of matrix indices
    % This simplistic approach finds the minimum and maximum; adjust as necessary.
    dB6RangeStart = [min(rows), min(cols)];
    dB6RangeEnd = [max(rows), max(cols)];
    
    % Display the result
    fprintf('6dB Drop Range starts at row %d, column %d and ends at row %d, column %d.\n', ...
            dB6RangeStart(1), dB6RangeStart(2), dB6RangeEnd(1), dB6RangeEnd(2));
end


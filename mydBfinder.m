function [selected_X_values,idxFound,mask] = mydBfinder(XdB,reference_X,dBScale)
%MYDBFINDER Summary of this function goes here
%   Using given dB conversion of a amplitude filtered B-Scan to pick up
%   values in given range.
%AUTHOR
%   Candidate 5.3 (2024)

    reference_dB = reference_X; % Replace x with your specific dB value
    
    mask = zeros(size(XdB));
    mask(find(XdB >= (reference_dB - dBScale) & XdB <= reference_dB)) = 1;
    
    % Apply the mask on the original matrix X
    selected_X_values = XdB .* mask;

    % Find the linear indices of the non-zero elements
    nonZeroIndices = find(mask);

    [rowIndices, colIndices] = ind2sub(size(XdB), nonZeroIndices);
    idxFound = [rowIndices, colIndices];
end


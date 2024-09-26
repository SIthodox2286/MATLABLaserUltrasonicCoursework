function [maxVal,idxReturn] = myMaximum(A)
%MYMAXIMUM Summary of this function goes here
%   Find the exact maximum in a 2d Matrix
%AUTHOR
%   Candidate 5.3 (2024)

% Step 1: Find the linear index of the maximum value
[maxVal, linearIdx] = max(A(:));

% Step 2: Convert the linear index to row and column indices
[rowIdx, colIdx] = ind2sub(size(A), linearIdx);
idxReturn = [rowIdx, colIdx];
end


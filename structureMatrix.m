function [A] = structureMatrix(NUMBER_OF_CABLES)
%STRUCTUREMATRIX This function returna a structure matrix A. Given the
%number of joints and cables used. Here we have 2 joints and 3 or 4 cables,
%given by NUMBER_OF_CABLES.
%   In case of 2 joints and 3 cables: we will have a 2 * 3 structure matrix.
%   In case of 2 joints and 3 cables: we will have 2 * 4 structure matrix.
%   Detailed explanation goes here
L_cap = [1, 1, 1, 1];
N = 2;
M = NUMBER_OF_CABLES;
A = zeros(N, M);

% Derive r as a function of q;


for n = 1:N 
    for m = 1:M
        %A(n, m) = [L_cap(m) * ()]
    end
end
end


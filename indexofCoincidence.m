function [indexOfCoincidence] = indexofCoincidence(charFreqs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

indexOfCoincidence = 0;

for i = 1:26
    indexOfCoincidence = indexOfCoincidence + charFreqs(i)*(charFreqs(i)-1);
end
    indexOfCoincidence = indexOfCoincidence / (sum(charFreqs)*(sum(charFreqs)-1));
end


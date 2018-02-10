function [indexOfCoincidence] = shiftIndexofCoincidence(inString)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1:26
    charFreqs(i)=sum(ismember(inString, i));
end
indexOfCoincidence = 0;

for i = 1:26
    indexOfCoincidence = indexOfCoincidence + charFreqs(i)*(charFreqs(i)-1);
end
    indexOfCoincidence = indexOfCoincidence / (sum(charFreqs)*(sum(charFreqs)-1));
end


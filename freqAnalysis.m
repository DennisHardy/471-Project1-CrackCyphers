function [monofreq, difreq] = freqAnalysis(inString)
%UNTITLED2 returns the number of time each character appears in instring
%   freq(1)= A, freq(26)=Z
inString = inString + '@';
inString = sprintf('%c', inString);
for a='A':'Z'
    monofreq(a-'@') = sum(ismember(inString, a));
    for b = 'A':'Z'
        difreq(a-'@',b-'@')= count(inString, strcat(a,b));
    end
end
end


function [monofreq, difreq] = freqAnalysis(inString)
%UNTITLED2 returns the number of time each character appears in instring
%   freq(1)= A, freq(26)=Z
inString = inString + '@';
inString = sprintf('%c', inString);
englishSorted = 'ETAOINSRHDLUCMFYWGPBVKXQJZ';
englishFreqs  = [12.02, 9.1, 8.12, 7.68, 7.31, 6.95, 6.28, 6.02, 5.92, 4.32, 3.98 2.88, 2.71, 2.61, 2.3, 2.11, 2.09, 2.03, 1.82, 1.49, 1.11, 0.69, 0.17, 0.11, 0.10, 0.07];

for a='A':'Z'
    monofreq(a-'@') = sum(ismember(inString, a));
    for b = 'A':'Z'
        difreq(a-'@',b-'@')= count(inString, strcat(a,b));
    end
end
difreq = 100*difreq./sum(sum(difreq));
ans = sum(sum(difreq));
[freqM, monogram]=sort(monofreq, 'descend');
shiftkey = monogram-englishSorted+'@';
shiftkey = mod(shiftkey, 26);

difreq = sort(difreq, 2, 'descend');

%print frequency of monograms
fprintf("Character Frequency of Ciphertext:\n");
for i=1:26
    fprintf("%s:\t%d\t%.2f%%\t| %s\t%.2f%%\tshiftkey: %d\n", monogram(i)+'@', freqM(i), 100*freqM(i)/sum(freqM), englishSorted(i), englishFreqs(i), shiftkey(i));
end

fprintf("%d\n", mode(shiftkey));
end


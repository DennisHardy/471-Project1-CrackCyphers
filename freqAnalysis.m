function [monofreq, difreq] = freqAnalysis(inString, print)
%UNTITLED2 returns the number of time each character appears in instring
%   freq(1)= A, freq(26)=Z
inString = inString + '@';
inString = sprintf('%c', inString);
englishSorted = 'ETAOINSRHDLUCMFYWGPBVKXQJZ';
englishFreqs  = [12.02, 9.1, 8.12, 7.68, 7.31, 6.95, 6.28, 6.02, 5.92, 4.32, 3.98 2.88, 2.71, 2.61, 2.3, 2.11, 2.09, 2.03, 1.82, 1.49, 1.11, 0.69, 0.17, 0.11, 0.10, 0.07];
englishDi = ["TH", "HE", "IN", "ER", "AN", "RE", "ES", "ON", "ST", "NT"];
englishDiFreqs = [2.71, 2.33, 2.03, 1.78, 1.61, 1.41, 1.32, 1.32, 1.25, 1.17];

for a='A':'Z'
    monofreq(a-'@') = sum(ismember(inString, a));
    for b = 'A':'Z'
        difreq(a-'@',b-'@')= count(inString, strcat(a,b));
    end
end
difreq = 100*difreq./sum(sum(difreq));
[freqM, monogram]=sort(monofreq, 'descend');
shiftkey = monogram-englishSorted+'@';
shiftkey = mod(shiftkey, 26);

[difreqs, diIndex] = sort(difreq(:), 'descend');
[diChar1, diChar2] = ind2sub(size(difreq), diIndex);
diFreqChar = horzcat(difreqs, diChar1,diChar2);

if print
    %print frequency of monograms:
    fprintf("Character Frequency of Ciphertext:\n");
    for i=1:26
        fprintf("%s:\t%d\t%.2f%%\t| %s\t%.2f%%\tshiftkey: %d\n", monogram(i)+'@', freqM(i), 100*freqM(i)/sum(freqM), englishSorted(i), englishFreqs(i), shiftkey(i));
    end

    %print frequency of (10 most common) digrams:
    fprintf("\nMost Frequent Digrams of Ciphertext:\n");
    for i=1:10
       fprintf("%s%s:\t%.2f\t| %s:\t%.2f%%\n", diFreqChar(i,2)+'@',diFreqChar(i,3)+'@', diFreqChar(i,1), englishDi(i), englishDiFreqs(i)); 
    end
end
%fprintf("%d\n", mode(shiftkey));
end


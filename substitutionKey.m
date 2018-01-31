function likelyKeys = substitutionKey(freq)
    %substitutionKey returns likely keys for substitution cipher given
    %character frequencies
    %   likelyKeys(1) = most likely key
    %   likelyKeys(n,1) = letter to replace 'A' in ciphertext
    
    englishSorted = 'ETAOINSRHD________________';
    [~, subKey] = sort(freq, 'desc');
    char likelyKeys(26);
    for i = 1:10
        likelyKeys(subKey(i)) = englishSorted(i);
    end
    
end
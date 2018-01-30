function likelyKeys = shiftkey(freq)
%Shift key determines the most likely shift keys using frequency analysis. 
%   The most common letter is set to E for likelyKeys(1)
%   The second most common letter is set to E for likelyKeys(2)
%   and so on

    [~, shiftKey] = sort(freq,'descend');
    likelyKeys = shiftKey - 5;
    for i=1:26
        if likelyKeys(i) < 0
            likelyKeys(i) = likelyKeys(i) + 26;
        end
    end
end
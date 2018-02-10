function [decrypted, key] = shiftdecrypt(encrypted, check)
%Shift Decrypt decrypts a message 
%   Detailed explanation goes here

for i = 1:26
    charFreqs(i)=sum(ismember(encrypted, i));
end

[~, shiftKey] = sort(charFreqs,'descend');
likelyKeys = shiftKey - 5;

for i=1:26
    if likelyKeys(i) < 0
        likelyKeys(i) = likelyKeys(i) + 26;
    end
end

for i = 1:26
    decrypted = encrypted - likelyKeys(i);
    for a = 1:size(decrypted)
        if decrypted(a) <= 0
            decrypted(a) = decrypted(a)+26;
        end
    end
    decrypted = decrypted+'@';
    key = likelyKeys(i);
    if ~check
        break
    end
    fprintf("\nPossible key: %d\n", likelyKeys(i));
    fprintf('%s\n', decrypted(1:100));
    prompt = 'Does this look correct?(Y/N): ';
    correct = input(prompt, 's');
    if correct == 'Y'
        break;
    end
end
end

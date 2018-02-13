function [decrypted, key] = permDecrypt(encrypted)
%permDecrypt decrypts a message encrypted using #key columns 
%   of a columnar transpostion


for key = 1:length(encrypted)/2
    %add to length of cipher if neccesarry
    clearvars -except encrypted key;
    cleanEncrypt = encrypted;
    extra = mod(key - mod(length(cleanEncrypt), key), key);
    for i = 1:extra
        cleanEncrypt = [cleanEncrypt;0];
    end
    
    CipherLength = length(cleanEncrypt);
    ColLength=ceil(CipherLength/key);
    
    for i=1:ColLength
        columns(i,:)= cleanEncrypt(i:ColLength:CipherLength);
    end
    decrypted=transpose(columns);
    decrypted=decrypted(:);
    [~, biFreqs]=freqAnalysis(decrypted, false);
    english = (biFreqs(20,8)+biFreqs(8,5)+biFreqs(9,14)+biFreqs(5,18)+biFreqs(1,14)+biFreqs(18,5)+biFreqs(5,19)+biFreqs(15,14)) > 10;
    if english
        decrypted=decrypted+'@';
        fprintf("\nPossible key: %d\n", key);
        fprintf('%s\n', decrypted(1:100));
        prompt = 'Does this look correct?(Y/N): ';
        correct = input(prompt, 's');
        if correct == 'Y'
            break;
        end
    end
end
end


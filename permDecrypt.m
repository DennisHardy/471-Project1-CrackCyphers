function [decrypted, key] = permDecrypt(encrypted)
%permDecrypt decrypts a message encrypted using #key columns 
%   of a columnar transpostion
key=10;
encrypted = char(encrypted+'@');
for i = 1:key
    decrypted(i,:) = encrypted(i:key:length(encrypted));
end
end


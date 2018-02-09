function decrypted = permDecrypt(encrypted,key)
%permDecrypt decrypts a message encrypted using #key columns 
%   of a columnar transpostion
l=1;
encrypted = char(encrypted);
for i = 1:key
    for j = i:key:length(encrypted)
        decrypted(l) = encrypted(j);
        l=l+1;
    end
end
end


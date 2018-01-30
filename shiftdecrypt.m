function decrypted = shiftdecrypt(encrypted, key)
%Shift Decrypt decrypts a message 
%   Detailed explanation goes here
decrypted = encrypted - key;
for a = 1:size(decrypted)
    if decrypted(a) <= 0
        decrypted(a) = decrypted(a)+26;
    end
end

end

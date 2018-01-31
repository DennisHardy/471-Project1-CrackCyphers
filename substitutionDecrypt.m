function decrypted = substitutionDecrypt(encrypted,key)
%substitutionDecrypt decrypt a message using a substitution cipher;
%   Detailed explanation goes here


for i = 1:length(encrypted)
   decrypted(i) = key(encrypted(i)); 
end

end


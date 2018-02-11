inputFile = fopen('ciphertexts/KnownShift17 copy.txt');
%cipher1= shift
%cipher2= substitution
%cipher3= vignere
%cipher4= otp??
%cipher5= transposition 82637451

%read input from fil
encryptedString = fread(inputFile, '*char');
fclose(inputFile);

%convert sting to charc=acter numbers: A=1, Z=26
encryptedString = upper(encryptedString);
encryptedString = encryptedString - '@';

%determine character and digram frequencies
[monofreq, difreq] = freqAnalysis(encryptedString, true);

%determine Index of Coincidence
IC = indexofCoincidence(monofreq);
fprintf("\nEncrypted text index of coincidence:\t%0.4f \n", IC);
fprintf("English text index of coincidence:\t0.0665 \n");
fprintf("Random text index of coincidence:\t0.0385 \n");

%use IC to narrow down cipher type
if IC <=0.039 %very low IC = One time pad (equivalent to random text)
    fprintf("Ciphertext is likely one-time pad. Cannot decrypt.\n");
    decryptedInfo = "Cipher type: One time pad. Decryption not possible.";
elseif IC <= 0.065
    fprintf("Ciphertext is likely Vigenere Cipher.\n");
    [decrypted, key] = Vdecrypt(encryptedString);
    key = char(key+'A');
    decryptedInfo = strcat("Cipher type: Vigenere Cipher. Key = '", key,"'.");
else 
    fprintf("Ciphertext is likely shift, substitution, or permutation cipher.\n");
    %if calculate shift key for each letter most frequent letter -> e 2nd
    %most freq -> t ...
    englishSorted = 'ETAOINSRHDLUCMFYWGPBVKXQJZ';
    [~, monogram]=sort(monofreq, 'descend');
    shiftkey = monogram-englishSorted+'@';
    shiftkey = mod(shiftkey, 26);
    [m, f] = mode(shiftkey);
    if f>=5 %if ther is a shift key shared by 5+ elements try 
        if m == 0 %if most common shift key is 0 permutation cipher
            [decrypted, key] = permDecrypt(encryptedString);
        end
        [decrypted, key] = shiftdecrypt(encryptedString, true);
        decryptedInfo = strcat("Cipher type: Shift Cipher. Key = ", string(key(:)), " ('",char(key(:)+'@'),"').");
    else %substitution cipher
        
    end
end

outputFile = fopen('output.txt', 'w');
fwrite(outputFile, decryptedInfo , '*char');
fclose(outputFile);
outputFile = fopen('output.txt', 'a');
fwrite(outputFile, newline , '*char');
fwrite(outputFile, decrypted , '*char');
fclose(outputFile);
inputFile = fopen('ciphertexts/cipher2.txt');
encryptedString = fread(inputFile, '*char');
fclose(inputFile);

encryptedString = upper(encryptedString);
encryptedString = encryptedString - '@';
[monofreq, difreq] = freqAnalysis(encryptedString);

possiblekeys = shiftkey(monofreq);

i=0;
correct = 'N';  
while correct ~= 'Y' && i < 26
    i = i+1;
    decryptedString = shiftdecrypt(encryptedString, possiblekeys(i));
    decryptedString = decryptedString + '@';
    fprintf('%s\n', decryptedString(1:100));
    prompt = 'Does this look correct?(Y/N): ';
    correct = input(prompt, 's');
        if isempty(correct)
            correct = 'N';
        end
end 


outputFile = fopen('test.txt', 'w');
fwrite(outputFile, decryptedString, '*char');
fclose(outputFile);
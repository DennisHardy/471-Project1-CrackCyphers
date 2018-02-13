function [decrypted, key] = substitutionDecrypt(encrypted,freq)
%substitutionDecrypt decrypt a message using a substitution cipher;
%   Detailed explanation goes here

    %   likelyKeys(1) = most likely key
    %   likelyKeys(n,1) = letter to replace 'A' in ciphertext
    position=1;
    englishSorted = 'ETAOIN____________________';
    plaintextbank = '_BCD_FGH_JKLM__PQRS_UVWXYZ';
    ciphertextbank= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    [~, subKey] = sort(freq, 'desc');
    char key(26);
    for i = 1:26
        key(subKey(i)) = englishSorted(i);
        if i <=6
            ciphertextbank(subKey(i)) = '_';
        end
    end
    
    for i = 1:length(encrypted)
      decrypted(i) = key(encrypted(i)); 
    end
    encrypted=encrypted+'@';
    fprintf("\nThe most common six letters have been placed (they may not be correct):\n");
    while ismember('_', decrypted)
        while ~ismember('_', decrypted(position:position+100));
            position = position + 50;
        end
        fprintf("\ncipher:%s \n", encrypted(position:position+100));
        fprintf("plain: %s \n", decrypted(position:position+100));
        fprintf("cipher text Bank: %s\n", ciphertextbank);
        fprintf("plain text Bank:  %s\n", plaintextbank);
        prompt = 'Enter cipher text letter to be replaced: ';
        old = input(prompt, 's');
        while old>'Z' || old<'A'
            prompt = 'Please enter a capital letter: ';
            old = input(prompt, 's');
        end
        prompt = strcat('Enter plain text letter to replace cipher(', old,'): ');
        new = input(prompt, 's');
        while new>'Z' || new<'A'
            prompt = 'Please enter a capital letter: ';
            new = input(prompt, 's');
        end
        plaintextbank(new-'@')='_';
        ciphertextbank(old-'@')='_';
        key(old-'@')=new;
        for i = 1:length(encrypted)
            if encrypted(i)==old
                decrypted(i) = new; 
            end
        end
    end
    
end


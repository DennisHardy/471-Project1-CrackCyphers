function [decrypted, key] = Vdecrypt(encrypted)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


    %determine key length using shifted IC
    for i=1:100
        for j = 1:i
        shiftedIC(i,j)= shiftIndexofCoincidence(encrypted(j:i:length(encrypted)));
        end
        SICAvg(i) = sum(shiftedIC(i,1:i))/i;
        if SICAvg(i) >= 0.065
            VkeyLength=i;
            break
        end
    end
    
    extra = VkeyLength - mod(length(encrypted), VkeyLength);
    for i = 1:extra
        encrypted = [encrypted;0];
    end
    
    for i = 1:VkeyLength
        row = encrypted(i:VkeyLength:length(encrypted));
        [test(i,:),key(i)] = shiftdecrypt(row, false);
    end
        decrypted = test(1:length(encrypted));
        
end


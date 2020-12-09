function [signal_bin] = binarisation(signal,seuil)
    for i=1:length(signal)
        if(signal(i)<=seuil)
            signal_bin(i) = 1;
        else
            signal_bin(i) = 0;
        end
    end
end
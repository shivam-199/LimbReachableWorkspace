function [exists] = existsInWorkspace(eta)
%EXISTSINWORKSPACE This function checks if all the column elements on eta
%   matrix are either positive or negative. Different columns can have
%   different polarity.

size_of_eta = size(eta);
exists = false;
for j=1:size_of_eta(2)
    if (all(eta(:, j) > 0) || all(eta(:, j) < 0))
        exists = true;        
    end
end

end


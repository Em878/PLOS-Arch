function X = bubblevecsort(X)
%--------------------------------------------------------------------------
% Syntax:       sx = bubblesort(x);
%               
% Inputs:       x is a vector of length n
%               
% Outputs:      sx is the sorted (ascending) version of x
%               
% Description:  This function sorts the input array x in ascending order
%               using the bubble sort algorithm
%               
% Complexity:   O(n)      best-case performance
%               O(n^2)    average-case performance
%               O(n^2)    worst-case performance
%               O(1)      auxiliary space
%               
% Author:       Brian Moore
%               brimoor@umich.edu
%               
% Date:         January 5, 2014
%--------------------------------------------------------------------------
% Bubble sort
[n a] = size(X);
while (n > 0)
    % Iterate through x
    nnew = 0;
    for i = 2:n
        % Swap elements in wrong order
        X(i,2)
        i
        if (X(i,2) < X(i - 1,2))
            
            X = swap(X,i,i - 1)
            nnew = i;
        end
    end
    n = nnew;
end
end
function X = swap(X,i,j)
% Swap x(i) and x(j)
% Note: In practice, x xhould be passed by reference
val=zeros(1,2);
val = X(i,:);
X(i,:) = X(j,:);
X(j,:) = val;
end


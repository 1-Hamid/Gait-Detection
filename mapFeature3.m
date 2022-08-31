function out = mapFeature3(X1, X2, X3, d)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%

% d = 8;
out = ones(size(X1(:,1)));
for i = 1:d
    for j = 0:i
        for k = 0:j
            out(:, end+1) = (X1.^(i-j)).*(X2.^(j-k)).*(X3.^k);
        end
    end
end

end
tic;

X = [-0.0112 -0.0015 0.0018 0.0115 -0.0393 0.0011];

X1 = X(:,1);
X2 = X(:,2);
X3 = X(:,3);
X4 = X(:,4);
X5 = X(:,5);
X6 = X(:,6);

X_map = ones(size(X1(:,1)));

for i = 1:3
    for j = 0:i
        for k = 0:j
            for l = 0:k
                for n = 0:l
                    for m = 0:n
                        X_map(:, end+1) = (X1.^(i-j)).*(X2.^(j-k)).*(X3.^(k-l)).*(X4.^(l-n)).*(X5.^(n-m)).*(X6.^m);
                    end
                end
            end
        end
    end
end

theta_1 = rand(84,1);
theta_2 = rand(84,1);
theta_3 = rand(84,1);
theta_4 = rand(84,1);

p = [X_map * theta_1, X_map * theta_2, X_map * theta_3, X_map * theta_4];

[~, label] = max(p(1,:));

toc;
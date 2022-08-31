function p4 = predict4(theta, X)

 m = size(X, 1); % Number of training examples

 p4 = zeros(m, 1);

theta_1 = theta.theta_1;
theta_2 = theta.theta_2;
theta_3 = theta.theta_3;
theta_4 = theta.theta_4;

p = [sigmoid(X * theta_1), sigmoid(X * theta_2), sigmoid(X * theta_3), sigmoid(X * theta_4)];

[~, label] = max(p(1,:));
p4(1) = label;

count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;

if numel(p4) > 1
    for i = 2: size(p,1)
        switch p4(i-1)
            
            case 1
                [~, label] = max(p(i,[1 2]));
                if label == 1 || (label == 2 && count1 <= 12)
                    p4(i) = 1;
                    count1 = count1 + 1;
                else
                    p4(i) = 2;
                    count1 = 0;
                end

            case 2
                [~, label] = max(p(i,[2 3]));
                if label == 1 || (label == 2 && count2 <= 10)
                    p4(i) = 2;
                    count2 = count2 + 1;
                else
                    p4(i) = 3;
                    count2 = 0;
                end

            case 3
                [~, label] = max(p(i,[3 4]));
                if label == 1 || (label == 2 && count3 <= 12)
                    p4(i) = 3;
                    count3 = count3 + 1;
                else
                   p4(i) = 4;
                    count3 = 0; 
                end

            case 4
                [~, label] = max(p(i,[4 1]));
                if label == 1 || (label == 2 && count4 <= 8)
                    p4(i) = 4;
                    count4 = count4 + 1;
                else
                    p4(i) = 1;
                    count4 = 0;
                end
            
        end
    end
end

end
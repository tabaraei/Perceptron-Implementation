clc;
clear;

x = [
      0.2 0.5 0.1;
      0.1 0.7 0.8;
      -0.1 0.6 0.9;
      -0.8 0.5 0.1;
      0.3 0.1 0.6;
      -0.7 0.9 0.1
];
t = [ -1 1 1 -1 1 -1 ];
w = zeros(1,size(x,2));
bias = 1;
b = 0;
tresh = 0.2;
alpha = 1;

while true
    check = false;
    
    for i=1:size(x,1)
        yin = sum(x(i,:).*w) + b*bias;
        if yin > tresh
            y = 1;
        elseif yin < -tresh
            y = -1;
        else
            y = 0;
        end
            
        if y ~= t(i)
            w = w + ((alpha*t(i)).*x(i,:));
            b = b + alpha*t(i)*bias;
            check = true;
        end
    end
    
    if check == false
        break
    end
end

fprintf('w1 = %d\n', w(1));
fprintf('w2 = %d\n', w(2));
fprintf('w3 = %d\n', w(3));
fprintf('b = %d\n', b);

figure(1)
axis([-1 1 -1 1 -1 1]);
grid on;
hold on;
title('Perceptron');
for i=1:size(x,1)
    scatter3(x(i,1),x(i,2),x(i,3), 'MarkerEdgeColor', [0.3 0.3 0.3]);
end
clc;
clear;

x = binaryBuilder(2);
t = [ -1 -1 -1 1 ];
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
fprintf('b = %d\n', b);

xDomain = [-2 2];
y1Domain = -(xDomain.*w(2) + (b+tresh)) / w(1);
y2Domain = -(xDomain.*w(2) + (b-tresh)) / w(1);

figure(1)
axis([-3 3 -3 3]);
hold on;
grid on;
title('Perceptron');
plot([-3 3],[0 0], 'color', [0.3 0.3 0.3]);
plot([0 0],[-3 3], 'color', [0.3 0.3 0.3]);
plot(xDomain, y1Domain);
plot(xDomain, y2Domain);
for i=1:size(x,1)
    scatter(x(i,1),x(i,2), 'MarkerEdgeColor', [0.3 0.3 0.3]);
end
clc;
clear;

x = [
        0.67044,-0.437;
        -0.35508,-0.53923;
        0.10452,0.42226;
        0.95826,0.24915;
        0.098617,0.18122;
        -0.33915,0.32088;
        0.23894,-0.90489;
        -0.27873,-0.30243;
        0.51302,-0.09732;
        -0.1722,-0.51819;
        -0.01531,0.43009;
        0.38949,0.71236;
        0.94547,-0.43698;
        -0.34449,0.4621;
        0.67561,-0.72447;
        0.47814,0.67345;
        0.90835,-0.7228;
        -0.93615,0.17642;
        -0.28626,-0.26769;
        0.32531,0.61352;
];
t = [ 1 -1 1 1 1 1 -1 -1 1 -1 1 1 1 1 -1 1 -1 -1 -1 1 ];
w = zeros(1,size(x,2));
bias = 1;
b = 0;
tresh = 0.1;
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
axis([-1 1 -1 1]);
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
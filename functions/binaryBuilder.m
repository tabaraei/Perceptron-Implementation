function A = binaryBuilder(bitCount)

states = 2^bitCount;
A = zeros(states, bitCount);

for i=1:states
    sum = i-1;
    for j=1:bitCount
        bitValue = 2^(bitCount - j);
        if bitValue <= sum
            sum = sum - bitValue;
            A(i,j) = 1;
        end
    end
end

end
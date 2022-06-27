function a = IntegralMethod(input)

    [n, m] = size(input);

    x = ones(n - 1, m + 1);
    y = ones(n - 1, m + 1);
    z = ones(n - 1, m + 1);

    for i = 1 : n - 1
        x(i, 1) = (input(i + 1, 1) + input(i, 1)) / 2;
        x(i, 2) = (input(i + 1, 1)^2 + input(i, 1)^2) / 2;
        x(i, 3) = (input(i + 1, 1) * input(i + 1, 2) + input(i, 1) * input(i, 2)) / 2;
        x(i, 4) = (input(i + 1, 1) * input(i + 1, 3) + input(i, 1) * input(i, 3)) / 2;

        y(i, 1) = (input(i + 1, 2) + input(i, 2)) / 2;
        y(i, 3) = (input(i + 1, 2)^2 + input(i, 2)^2) / 2;
        y(i, 2) = (input(i + 1, 2) * input(i + 1, 1) + input(i, 2) * input(i, 1)) / 2;
        y(i, 4) = (input(i + 1, 2) * input(i + 1, 3) + input(i, 2) * input(i, 3)) / 2;

        z(i, 1) = (input(i + 1, 3) + input(i, 3)) / 2;
        z(i, 4) = (input(i + 1, 3)^2 + input(i, 3)^2) / 2;
        z(i, 2) = (input(i + 1, 3) * input(i + 1, 1) + input(i, 3) * input(i, 1)) / 2;
        z(i, 3) = (input(i + 1, 3) * input(i + 1, 2) + input(i, 3) * input(i, 2)) / 2;

    end

    d1 = ones(n - 1, 1);
    d2 = ones(n - 1, 1);
    d3 = ones(n - 1, 1);

    for i = 1 : n - 1
        d1(i) = input(i + 1, 1) - input(i, 1);
        d2(i) = input(i + 1, 2) - input(i, 2);
        d3(i) = input(i + 1, 3) - input(i, 3);
    end

    a1 = (inv(transpose(x) * x)) * transpose(x) * d1;
    a2 = (inv(transpose(y) * y)) * transpose(y) * d2;
    a3 = (inv(transpose(z) * z)) * transpose(z) * d3;

    a = [a1 a2 a3];
    
end
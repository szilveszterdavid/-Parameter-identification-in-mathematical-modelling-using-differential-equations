function a = LogIntegralMethod(input)

    [n, m] = size(input);

    x2 = ones(n - 1, m + 1);
    y2 = ones(n - 1, m + 1);
    z2 = ones(n - 1, m + 1);

    for i = 1 : n - 1
        x2(i, 1) = 1;
        x2(i, 2) = (input(i + 1, 1) + input(i, 1)) / 2;
        x2(i, 3) = (input(i + 1, 2) + input(i, 2)) / 2;
        x2(i, 4) = (input(i + 1, 3) + input(i, 3)) / 2;

        y2(i, 1) = 1;
        y2(i, 2) = (input(i + 1, 1) + input(i, 1)) / 2;
        y2(i, 3) = (input(i + 1, 2) + input(i, 2)) / 2;
        y2(i, 4) = (input(i + 1, 3) + input(i, 3)) / 2;

        z2(i, 1) = 1;
        z2(i, 2) = (input(i + 1, 1) + input(i, 1)) / 2;
        z2(i, 3) = (input(i + 1, 2) + input(i, 2)) / 2;
        z2(i, 4) = (input(i + 1, 3) + input(i, 3)) / 2;
    end

    d21 = ones(n - 1, 1);
    d22 = ones(n - 1, 1);
    d23 = ones(n - 1, 1);

    for i = 1 : n - 1
        d21(i) = log(input(i + 1, 1)) - log(input(i, 1));
        d22(i) = log(input(i + 1, 2)) - log(input(i, 2));
        d23(i) = log(input(i + 1, 3)) - log(input(i, 3));
    end

    a21 = (inv(transpose(x2) * x2)) * transpose(x2) * d21
    a22 = (inv(transpose(y2) * y2)) * transpose(y2) * d22
    a23 = (inv(transpose(z2) * z2)) * transpose(z2) * d23

    a = [a21 a22 a23];
    
end
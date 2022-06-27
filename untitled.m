
function dy = LotkaVolterra(t, y, params)

    a = params(1);
    b = params(2);
    c = params(3);
    d = params(4);

    X = y(1);
    Y = y(2);

    dy = zeros(2, 1);

    dy(1) = a * X - b * X * Y;
    dy(2) = c * Y - d * X * Y;

end
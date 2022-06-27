function dydt = Lotka_Volterra(~, y, k)
    dy1 = y(1) * (k(1, 1) + y(1) * k(2, 1) + y(2) * k(3, 1) + y(3) * k(4, 1));
    dy2 = y(2) * (k(1, 2) + y(1) * k(2, 2) + y(2) * k(3, 2) + y(3) * k(4, 2));
    dy3 = y(3) * (k(1, 3) + y(1) * k(2, 3) + y(2) * k(3, 3) + y(3) * k(4, 3));
    dydt = [dy1 dy2 dy3]';
end
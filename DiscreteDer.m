function [w_new] = DiscreteDer(w,A)

Ts=1; %sampling time

w1_new = Ts * (w(1) * (A(1, 1) + A(1, 2) * w(1) + A(1, 3) * w(2) + A(1, 4) * w(3))) + w(1);
w2_new = Ts * (w(2) * (A(2, 1) + A(2, 2) * w(1) + A(2, 3) * w(2) + A(2, 4) * w(3))) + w(2);
w3_new = Ts * (w(3) * (A(3, 1) + A(3, 2) * w(1) + A(3, 3) * w(2) + A(3, 4) * w(3))) + w(3);

w_new=[w1_new w2_new w3_new];

end


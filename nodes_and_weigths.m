function [w_res, x_res] = nodes_and_weigths(N, DIGITS)
digits(DIGITS);
P = vpa(zeros(N, N));
for i = 1 : 1 : (N - 1)
%         P(i, i + 1) = vpa(((i - 1) + 1) / (2 * (i - 1) + 1));
    P(i, i + 1) = vpa(vpa(0.5)/...
        vpa(sqrt(vpa(1) - vpa(vpa(2) * vpa(i))^vpa(-2))));
end
for i = 2 : 1 : N
%         P(i, i - 1) = vpa((i - 1) / (2 * (i - 1) + 1));
    P(i, i - 1) = vpa(vpa(0.5)/...
        vpa(sqrt(vpa(1) - vpa(vpa(2) *...
        vpa(vpa(i) - vpa(1)))^vpa(-2))));
end
[V, D] = eig(vpa(P));
x_res = diag(vpa(D));
% w_res = vpa(zeros(N, 1));
% for i = 1 : 1 : N
%     w_res(i, 1) = vpa(vpa(2)*vpa(vpa(1)-vpa(x_res(i, 1))^vpa(2))/...
%         vpa(N)^vpa(2) / vpa(legendreP(N-1, vpa(x_res(i, 1))))^vpa(2));
% end
w_res = vpa(vpa(2) .* vpa(vpa(V(1, :)).' .* vpa(V(1, :).')));
% disp(P);
end


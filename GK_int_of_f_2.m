function res = GK_int_of_f_2(a, b, N_Gauss, DIGITS)
digits(DIGITS);
[w, x] = nodes_and_weigths(N_Gauss, DIGITS);
temp = vpa(0);
for i = 1 : 1 : N_Gauss
    temp = vpa(vpa(temp) + vpa(w(i, 1)) *...
        vpa(f(vpa(vpa(vpa(b)+vpa(a))/vpa(2) +...
        vpa(vpa(b)-vpa(a))/vpa(2)*vpa(x(i, 1))),...
        DIGITS)));
end
res = vpa(vpa(temp)*vpa(vpa(b)-vpa(a))/vpa(2));
end


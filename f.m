function res = f(x, DIGITS)
digits(DIGITS);
% C = vpa(20);
% D = vpa(1);
% E = vpa(20);
res = vpa(vpa(1)/vpa(x)^vpa(vpa(1)/vpa(2)));
% res = vpa(vpa(pi)/vpa(2)*vpa(sin(vpa(vpa(pi)/vpa(2)*vpa(x)))));
% res = vpa(vpa(cos(vpa(x)))/vpa(vpa(1)-...
%     vpa(2)*vpa(2)*vpa(cos(vpa(x)))+vpa(2)^vpa(2)));
% res = vpa(vpa(vpa(1)/vpa(vpa(C)*vpa(vpa(1)-vpa(E)))*...
%     vpa(vpa(vpa(C)+vpa(D))^vpa(vpa(1)-vpa(E)) -...
%     vpa(D)^vpa(vpa(1)-vpa(E))))^vpa(-1)/...
%     vpa(vpa(C)*vpa(x)+vpa(D))^vpa(E));
% if (x == 0)
%     res = vpa(0);
% else
%     res = vpa(exp(vpa(-1)*vpa(vpa(vpa(x)^vpa(2))+...
%         vpa(vpa(1)/vpa(vpa(x)^vpa(2))))));
% end
end


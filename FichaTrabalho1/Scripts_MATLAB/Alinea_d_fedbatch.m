
function [dydt] = fedbatch(t,y)

x = y(1); s = y(2); a = y(3); p = y(4); v = y(5);

k1 = 4.412;k2 = 22.22;k3 = 8.61;k4 = 9.846;k5 = 3.253;k6 = 12.29;
k7 = 4.085;k8 = 3.345;k9 = 21.04;k10 = 7.65;k11 = 13.21;

ks1 = 0.3;ks2 = 0.3;ks3 = 0.4;

u1 = (0.3*s)/(ks1+s);u2 = (0.6*s)/(ks2+s);u3 = (0.2*a)/(ks3+a);

fe = 0.7;
D = fe/v;
Se = 350;

dydt = [(u1*x+u2*x+u3*x)-(D*x)
(-k1*u1*x-k2*u2*x)-(D*s)+(D*Se)
(k3*u2*x-k4*u3*x)-(D*a)
(k11*u1*x)-(D*p)
D*v];

end


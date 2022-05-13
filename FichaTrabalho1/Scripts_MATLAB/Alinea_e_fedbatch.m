
function [ dydt ] = Alinea_e_fedbatch( t, y, K )

x = y(1);s = y(2);a = y(3);p = y(4);v = y(5);

k1 = 4.412;k2 = 22.22;k3 = 8.61;k4 = K(1);k11 = 13.21;

umax1 = 0.25;umax2 = K(3);umax3 = 0.25;

ks1 = 0.3;ks2 = 0.3;ks3 = K(2);


u1 = (umax1*s)/(ks1+s);u2 = (umax2*s)/(ks2+s);u3 = (umax3*a)/(ks3+a);

fe = 0.7;D = fe/v;Se = 350;

dydt = [(u1*x+u2*x+u3*x)-(D*x)
(-k1*u1*x-k2*u2*x)-(D*s)+(D*Se)
(k3*u2*x-k4*u3*x)-(D*a)
(k11*u1*x)-(D*p)
D*v];

end
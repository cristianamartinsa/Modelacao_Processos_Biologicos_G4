syms x s a v k1 k2 k4 umax2 ks3

u1 = (0.25*s)/(0.3+s); u2 = (umax2*s)/(0.3+s); u3 = (0.25*a)/(ks3+a); 

fe = 0.7;
D = fe/v;
Se = 350;

dXdt = u1*x+u2*x+u3*x-(D*x);
dSdt = -k1*u1*x-k2*u2*x-(D*s)+(D*Se);

dX_k4 = diff(dXdt,k4);
dX_u2 = diff(dXdt,umax2);
dX_ks3 = diff(dXdt,ks3);
dS_k4 = diff(dSdt,k4);
dS_u2 = diff(dSdt,umax2);
dS_ks3 = diff(dSdt,ks3);

ci = [4 0 0 0 8];
K0 = [9.846 0.4 0.55];
tspan = 0:0.5:20;
options = optimset;
[t,y] = ode23s(@Alinea_e_fedbatch, tspan, ci, options, K0); 

x=y(:,1);
s=y(:,2);

dX_k4 = subs(dX_k4);
dX_u2 = subs(dX_u2);
dX_ks3 = subs(dX_ks3);
dS_k4 = subs(dS_k4);
dS_u2 = subs(dS_u2);
dS_ks3 = subs(dS_ks3);


%Plots
figure
plot(t,dX_k4*ones(size(t)))
title('Sensibilidade ao longo do tempo de variável X ao parâmetro k4')
xlabel('tempo (hora)')
ylabel('');
legend('dXdt(k4)');

figure
plot(t, dX_u2);
legend('dXdt{umax2}');
title('Sensibilidade ao longo do tempo de variável X ao parâmetro umax2');
xlabel('tempo (hora)');
ylabel('');

%figure
%plot(t, dX_ks3);
%legend('dXdt(ks3)');
%title('Sensibilidade ao longo do tempo de variável X ao parâmetro ks3');
%xlabel('tempo (hora)');
%ylabel('');


figure
plot(t,(dS_k4*ones(size(t))));
legend('dSdt(k4)');
title('Sensibilidade ao longo do tempo de variável S ao parâmetro k4');
xlabel('tempo (hora)');
ylabel('');

%figure
%plot(t, dS_u2);
%legend('dSdt(u2)');
%title('Sensibilidade ao longo do tempo de variável S ao parâmetro umax2');
%xlabel('tempo (hora)');
%ylabel('');

figure
plot(t,(dS_ks3*ones(size(t))));
legend('dSdt(ks3)');
title('Sensibilidade ao longo do tempo de variável S ao parâmetro ks3');
xlabel('tempo (hora)');
ylabel('');




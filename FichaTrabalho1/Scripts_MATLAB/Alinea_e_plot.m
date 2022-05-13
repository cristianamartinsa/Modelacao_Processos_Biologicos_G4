
% Modelo BL21
ci= [4 0 0 0 8]';
tspan = 0: 0.5: 20; 
[~,y] = ode23s(@Alinea_d_fedbatch, tspan, ci); 

% Modelo experimental
data_exp = readtable('dados_exp_4.xlsx'); 

% Modelo BL21
X_ini = y(:,1);
S_ini = y(:,2);
A_ini = y(:,3);
P_ini = y(:,4);
V_ini = y(:,5);

% Modelo experimental
t = table2array(data_exp(:,1));
X_exp = table2array(data_exp(:,2));
S_exp = table2array(data_exp(:,3));
A_exp = table2array(data_exp(:,4));
V_exp = table2array(data_exp(:,5));

%Plot
plot(t, X_ini, t, X_exp,'--o', t, S_ini, t, S_exp, '--o', t, A_ini, ...
    t, A_exp, '--o', t, P_ini, t, V_ini, t, V_exp,'--')
xlabel('Tempo (h)')
ylabel('Concentração (g/L)')
title('Modelo BL21 vs Experimental')
legend('Biomassa Modelo BL21', 'Biomassa Experimental', ...
    'Substrato Modelo BL21', 'Substrato Experimental', ...
    'Acetato Modelo BL21', 'Acetato Experimental', ...
    'Produto Modelo BL21', 'Volume Modelo BL21', 'Volume Experimental')
set(gca, 'XTick', 0:0.5:20)


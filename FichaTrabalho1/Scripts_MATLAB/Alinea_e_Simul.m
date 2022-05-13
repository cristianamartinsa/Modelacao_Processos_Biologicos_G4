
%Simulação
Ki = [9.846 0.4 0.55];
dados_exp = readtable('dados_exp_4.xlsx');
t = table2array(dados_exp(:, 1));
y_exp = table2array(dados_exp(:, 2:3));
fun = @(K)Alinea_e_Erro(t, y_exp, K); 
lb = [0 0 0]; 
ub = [10 10 10]; 
opt = optimset('MaxIter', 100);
simul = simulannealbnd(fun, Ki, lb, ub, opt)

%Plot
ci= [4 0 0 0 8]; 
tspan = [0:0.5:20]; 
options = optimset
[t,y] = ode23s(@Alinea_e_fedbatch, tspan, ci, options, simul)
y_dados_exp = table2array(dados_exp(:, 2:5))
plot(t, y, t, y_dados_exp, '--o');
xlabel('Tempo (h)')
ylabel('Concentração (g/L)')
legend({'Biomassa Estimado BL21', 'Glucose Estimado BL21', ...
    'Acetato Estimado BL21', 'Proteína Recombinante Estimado BL21', ...
    'Volume Estimado BL21', 'Biomassa Exp BL21', 'Glucose Exp BL21', ...
    'Acetato Exp BL21', 'Volume Exp BL21'})





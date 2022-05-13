
function erro = Erro( t, y_exp, K)

ci= [4 0 0 0 8]; 
options = optimset;
[t, y] = ode23s(@Alinea_e_fedbatch, t, ci, options, K); 

%Modelo BL21
X_y = y(:,1);
S_y = y(:,2);

%Modelo experimental
X_yexp = y_exp(:,1);
S_yexp = y_exp(:,2);

%Erros
dif_X = sum((X_y - X_yexp).^2);
dif_S = sum((S_y - S_yexp).^2);
dif_total = dif_S + dif_X;
erro = dif_total;

end


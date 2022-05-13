
ci= [4 0 0 0 8]';
tspan = [0 20]; 
[t,y] = ode23s(@Alinea_d_fedbatch, tspan, ci); 
plot(t, y, 'linewidth', 1);
xlabel('Tempo (h)')
ylabel('Concentração (g/L)')
legend({'Biomassa','Glucose','Acetato','Proteína recombinante','Volume'})



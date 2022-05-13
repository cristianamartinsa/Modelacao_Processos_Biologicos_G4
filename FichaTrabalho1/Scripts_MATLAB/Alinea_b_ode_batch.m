
ci = [7 12 0 0 9]'; 
tspan = [0 7]; 
[T,y] = ode23s(@Alinea_b_batch, tspan, ci);
plot(T, y, 'linewidth', 1);
xlabel('Tempo (h)')
ylabel('Concentração (g/L)')
legend({'Biomassa','Glucose','Acetato','Proteía recombinante','Volume'})




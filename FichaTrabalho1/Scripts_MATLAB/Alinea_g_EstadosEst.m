clc; clear all; close all;

y1 = [0 0 0 0]; 
%setNL=@Alinea_g_Modelo;
%y=fsolve(setNL, y0)
[y_1, fy_1]=fsolve(@Alinea_g_Modelo, y1)


y2 = [0 4 0 0]; 
%setNL=@Alinea_g_Modelo;
%y=fsolve(setNL, y0)
[y_2, fy_2]=fsolve(@Alinea_g_Modelo, y2)

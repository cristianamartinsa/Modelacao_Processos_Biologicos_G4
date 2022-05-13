clc; clear all; close all;

y0 = [0 0 0 0]; %Initial guess
%setNL=@Alinea_g_Modelo;
%y=fsolve(setNL, y0)
[y, fy]=fsolve(@Alinea_g_Modelo, y0)
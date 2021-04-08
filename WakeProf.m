clc
close all

U = 1; %m/s
z = .05*2; % z dist
D = 1; %m

Uy = Wake1S5.VarName4;
ydata = Wake1S5.VarName2;

for i=1:92
    udat(i) = Uy(i)/1.035;
end

for i=1:length(Uy)
    vel(i) = udat(i)*(1-udat(i));
end

plot(udat(1:92),Wake1S5.VarName2,'*-')
xline(1)
xlabel('U(y)/U')
ylabel('Y grid location')

Fz = trapz(vel)

F = Fz*z %N

Cd = Fz/(1/2*1*U^2*D)

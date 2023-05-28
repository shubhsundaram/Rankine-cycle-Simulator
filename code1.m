clear all
close all
clc

% inputs and process lables
fprintf('      RANKINE CYCLE SIMULATOR        \n');
fprintf('1-2 Isentropic expansion in turbine\n');
fprintf('2-3 Constant pressure heat rejection in Condensor\n');
fprintf('3-4 Isentropic compression in the pump\n');
fprintf('4-1 Constant pressure heat addition in boiler\n');
t1 = input('Enter the temperature at turbine inlet(degree celcius) :  ');
p1 = input('Enter the pressure at turbine inlet(bar) :  ');
p2 = input('Enter the Condensor Inlet Pressure(bar) :  ');
%also

%state 1-2
h1 = XSteam('h_pT',p1,t1);
s1 = XSteam('s_pT',p1,t1);
%state 2-3
s2 = s1;
sf2 = XSteam('sL_p',p2);
sg2 = XSteam('sV_p',p2);
hf2 = XSteam('hL_p',p2);
hg2 = XSteam('hV_p',p2);
x2 = (s2-sf2)/(sg2-sf2);
h2 = hf2+(x2*(hg2-hf2));
%state 3-4
p3 = p2;
h3 = XSteam('hL_p',p3);
s3 = XSteam('sL_p',p3);
t3 = XSteam('Tsat_p',p3);
t2 = t3;
%state 4-1
p4 = p1;
s4 = s3;
h4 = XSteam('h_ps',p4,s4);
cp4 = XSteam('Cp_ps',p4,s4);
cv4 = XSteam('Cv_ps',p4,s4);
gamma = (cp4/cv4);
t4 = (t3/((p3/p4)^((gamma-1)/(gamma))));
t5 = XSteam('Tsat_p',p1);
t6 = t5;
s5 = XSteam('sL_p',p1);
s6 = XSteam('sV_p',p1);
h5 = XSteam('hL_p',p1);
h6 = XSteam('hV_p',p1);
%finding the work
%work done on turbine
Wt = (h1-h2);
%work done by pump
Wp = (h4-h3);
%net work 
W = (Wt-Wp);
%calculation for heat supplied and heat rejected
Q_supp = (h1-h4);
Q_rej = (h2-h3);
%Thermal efficiency
N_therm = ((W/Q_supp)*100);
%steam rate
SR = (3600/W);
%back work ratio
BWR = (h1-h4)/(h2-h3);

%plotting saturation curve
T = linspace(1,400,600);
for i = 1:length(T)
    h_l(i) = XSteam('hL_T',T(i));
    h_v(i) = XSteam('hV_T',T(i));
    s_l(i) = XSteam('sL_T',T(i));
    s_v(i) = XSteam('sV_T',T(i));
end
%Plooting T-S Diagram
figure(1)
hold on
plot([s1 s2],[t1 t2],'linewidth',2.5,'color','r')
plot([s2 s3],[t2 t3],'linewidth',2.5,'color','r')
plot([s3 s4],[t3 t4],'linewidth',2.5,'color','r')
plot([s4 s5],[t4 t5],'linewidth',2.5,'color','r')
plot([s5 s6],[t5 t6],'linewidth',2.5,'color','r')
xlabel('Entropy[kj/kgk]')
ylabel('Temperature[deg C]')
title('T-S Diagram')
s_0 = linspace(s6,s1,600);
for j = 1:length(s_0)
    t_0(j) = XSteam('T_ps',p1,s_0(j));
end
plot(s_0,t_0,'linewidth',2.5,'color','r')
plot(s_l,T,'linewidth',1,'color','b')
plot(s_v,T,'linewidth',1,'color','b')
%Annotations
text(s1,t1,'1');
text(s2,t2,'2');
text(s3,t3,'3');
text(s4,t4,'4');
text(s5,t5,'5');
text(s6,t6,'6');

%plotting H-S Diagram
figure(2)
hold on
plot([s1 s2],[h1 h2],'linewidth',2.5,'color','g')
plot([s2 s3],[h2 h3],'linewidth',2.5,'color','g')
plot([s3 s4],[h3 h4],'linewidth',2.5,'color','g')

h_0 = linspace(h4,h5,600);
for k = 1:length(h_0)
    s_4(k) = XSteam('s_ph',p1,h_0(k));
end
h_01 = linspace(h6,h1,600);
for m = 1:length(h_01)
    s_6(m) = XSteam('s_ph',p1,h_01(m));
end
plot(s_4,h_0,'linewidth',2.5,'color','g')
plot([s5 s6],[h5 h6],'linewidth',2.5,'color','g')
plot(s_6,h_01,'linewidth',2.5,'color','g')
plot(s_l,h_l,'linewidth',1,'color','b')
plot(s_v,h_v,'linewidth',1,'color','b')
xlabel('Specific Entropy[kj/kgk]')
ylabel('Specific Enthalpy[kj/kg]')
title('H-S Diagram')
%Annotations 
text(s1,h1,'1');
text(s2,h2,'2');
text(s3,h3,'3');
text(s4,h4,'4');
text(s5,h5,'5');
text(s6,h6,'6');

%Results
fprintf('    RESULT    \n');
fprintf('state 1 :\n')
fprintf('P1 = %f bar\n',p1);
fprintf('T1 = %f deg celcius\n',t1);
fprintf('H1 = %f kj/kg\n',h1);
fprintf('S1 = %f kj/kgk\n',s1);

fprintf('state 2 :\n');
fprintf('P2 = %f bar\n',p2);
fprintf('T2 = %f deg celcius\n',t2);
fprintf('H2 = %f kj/kg\n',h2);
fprintf('S3 = %f kj/kgk\n',s2);

fprintf('state 3 :\n');
fprintf('P3 = %f bar\n',p3);
fprintf('T3 = %f deg celcius\n',t3);
fprintf('H3 = %f kj/kg\n',h3);
fprintf('S3 = %f kj/kgk\n',s3);

fprintf('state 4 :\n');
fprintf('P4 = %f bar\n',p4);
fprintf('T4 = %f deg celcius\n',t4);
fprintf('H4 = %f kj/kg\n',h4);
fprintf('s4 = %f kj/kgk\n',s4);

fprintf('Work done on the turbine : %f kj/kg\n',Wt);
fprintf('Work done by pump : %f kj/kg\n',Wp);
fprintf('Net work done : %f kj/kg\n',W);
fprintf('Steam Rate : %f kg/kwh\n',SR);
fprintf('Thermal efficiency : %f\n',N_therm);
fprintf('The BWR of the cycle : %f\n',BWR);

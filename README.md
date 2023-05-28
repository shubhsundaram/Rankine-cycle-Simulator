# Rankine-cycle-Simulation
Rankine Cycle is used to predict about performance of both 'Steam Turbine' and 'Reciprocating Steam Engines'.Rankine cycle is an idealised thermodynamic cycle of heat engines which give electrical energy after converting mechanical energy.
![rankine](https://github.com/shubhsundaram/Rankine-cycle-Simulator/assets/108191939/84a72e83-56a9-48ca-af14-d81cae13a616)
1:TURBINE.
2:CONDENSOR.
3:PUMP
4:BOILER.

There are four processes undergoes in Rankine Cycle:

1.) Process 3-4: pumping of working fluid from low pressure to high pressure takes place.this is the initial process also kniwn as Isentropic Compression.

2.) process 4-1: The pressurized working fluid now enters a boiler where it start to boil at constant pressure until it becomes saturated vapour.also known as constant pressure heat addition process.

3.) process 1-2: The saturated vapour then enters the turbine and get expand through it making it to produce mechanical work.the output working fluid comes with decrease in both pressure and temperature.also known as Isntropic expansion.

4.) process 2-3: The last process is of condensation of the output working fluid from the turbine outlet.condensor condenses the working fluid at constant pressure till it becomes saturated liquid.

The calculations for Rankine Cycle are given below:

Qnet = Wnet
Qin - Qout = Wt - Wp
Qin = heat supplied by the boiler(kj/kg)
Qout = heat rejected by condensor(kj/kg)
Wt = Work done on the turbine(kj/kg)
Wp = Work done by the pump(kj/kg)
Wnet = Wt - Wp
Efficiency of the cycle is given by:
efficiency = Wnet/Qin
also after applying SFEE equation we get
Qin = h1 -h4
Qout = h2 - h3
Wt = h1 -h2
Wp = h4 - h3
Steam Rate : it is defined as rate of steam flow to produce unit KW of output power.and the formula for it is given as below:  SR = 3600/Wnet.

Explanation for the code is as follows:

1.) to erase the workspace we use clear all,close all and clc command.
2.) The input and process labels are  given using fprintf command.
3.) using input command the values of P1,T1 and P2 are to be assigned in command window while exwcuting the program.
4.) The data is restored from the file XSteam.m which is a data table.for state 1 the data for enthalpy and entropy are extracted using variables h_pT and s_pT as assigned.
5.) similarly values of variables for other states are to be calculated using the same way.
6.) for state 2 since the vapour is converted into liquid. the Dryness fraction, enthalpy and entropy for both the liquid and vapour are to be calculated seperately.
7.)at state 3 the temperature at exit of condensor and entry of pump are same.for state 4 since heat addition takes place at constant pressure and volume so entropy will not change and gamma is used to calculate T4 here.
8.) then work done , heat involved and SR are calculated.To plot the saturation curve now temperature is divide into 600 numbers using linspace and for each value the enthalpy and entropy are calculated.
9.) now both the T-S and H-S plots are plotted using plot command  successfully and annotations are added using text command and results of every state points are shown in the command window using fprintf command.

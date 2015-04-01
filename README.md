# Shuttle_FDM_Simulator
Flight Dymanic Model of Space Shuttle

The project contains the Flight Dynamic Simulation Model of Space Shuttle Orbiter in approach and landing phase. 
The model build in Matlab/Simulink environment. For commands input and visualization used FlightGear flight simulator. Simulation model can be used for modeling of various scenarios of Orbiter or other similar reentry vehicles landing in different configurations. Simulation model built in the way to be real-time system, in order to provide ability to perform manual or semiautomatic landing mode.

-------------------------------------------------------------

Instruction to Run the Orbiter Flight Dynamics Simulation Model in Simulink

-------------------------------------------------------------
Diploma Master Thesis
by Sokolov Alexandr
Under supervision of Maciej Zasuwa, PhD

Faculty of Power and Aeronautical Engineering
Warsaw University of Technology / Politechnika Warszawska
June 2014

-------------------------------------------------------------

In order to visualize the vehicle attitude in FlightGear make the following steps:

1. Put the folder <shuttle> into directory with aircraft model.Default directory is: C:\Program Files\FlightGear\data\Aircraft
2. launch the runfg.bat file, it will open the FlightGear with support of external dynamics mode.


In order to run the simulation model in Simulink follow the instruction below:

1. Open the Orbite_InitialParamaters.m file in Matlab and RUN it; it will put all necessary variables into workspace.The Shuttle_Orbiter_FDM.slx will be opend in Simulink; 
2. RUN the simulation in Simulink.

By the default the control system is activated and landing is in automatic in longitudinal axes.
Switch to manual mode to control vehicle by keyboard and mouse.


Notes:
The simulation model built in Matlab ver. R2013b. and desing for connection with FlightGear ver. 2.10 or later.
Additionally used Aerosim Blockset for Simulink.

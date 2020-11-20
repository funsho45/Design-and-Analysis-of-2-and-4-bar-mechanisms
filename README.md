# Design-and-Analysis-of-2-and-4-bar-mechanisms

This project consisted of using both MATLAB and Siemens NX  to carry out simulations of mechanism systems.

# What is this?

A constrained rigid body system, in which one of the bodies is in the frame is referred to as a mechanism. When considering a constrained rigid body system, the degrees of freedom of that mechanism is important. 

For this project the simulation and analysis of a hypathtical two-bar linked planar manipulator which welds a structure in a production line was carried out. Also a four-bar link planar mechanism thats would be driven by an electric motor was also simulated analyed.

# Method

MATLAB software will be used to create a simulation of both these link bar mechanisms, with defining variables, such as the velocity, length, mass and inertia. For theoretical calculations, MATLAB is a popular software when it comes to the analysis of experimental data. The mechanisms will also be modelled in Siemens NX, which a motion simulation will then be carried out to produce graphical results which will be compared against results produced in MATLAB.

## Two bar link mechanism

The two-bar link planar manipulator shown in **Figure 1**, consists of link OA, which is fixated to the point of and to the link AB at point A. To ensure that point B travels in a straight-line path in the XY coordinates, from (0.3m,0.0m) to (0.0m,0.3m) with a constant velocity of 2 m/s, the angles 𝜃1 and 𝜃2 will be controlled.

![image](https://user-images.githubusercontent.com/73448401/99807238-1f1b2380-2b37-11eb-8c52-e8269a290f47.png)

**Figure 1**: Two bar link manipulator

### Mathematical modelling of Two bar link

Before carrying out the simulation, a mathematical model of the system needs to be developed.
The parameters given of the two-bar link system are the following:

r1 = 0.3m

r2 = 0.2m

Velocity at point B = 2 m/s

Where:

r1= Link OA length 

r2= Link AB length

A mathematical analysis will be performed to obtain equations that describe the system.

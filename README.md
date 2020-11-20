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

#### The Position Analysis

For the closed loop OABC:

𝑟1𝑐𝑜𝑠𝜃1 + 𝑟2𝑐𝑜𝑠𝜃2 − 𝑥𝑏 = 0

**Equation 1**

𝑟1𝑠𝑖𝑛𝜃1 + 𝑟2𝑠𝑖𝑛𝜃2 − 𝑦𝑏 = 0 (2)

**Equation 2**

Solving for both 𝑟1𝑐𝑜𝑠𝜃1 and 𝑟1𝑠𝑖𝑛𝜃1 gives:

𝑟1𝑐𝑜𝑠𝜃1 = 𝑥𝐵 − 𝑟2𝑐𝑜𝑠𝜃2 (3)

**Equation 3**

𝑟1𝑠𝑖𝑛𝜃1 = 𝑦𝐵 − 𝑟2 sin 𝜃2

**Equation 4**

By squaring and adding up both sides of the equations the mechanisms position can be found:

𝐴𝑐𝑜𝑠𝜃2 + 𝐵𝑠𝑖𝑛𝜃2 = 𝐶

**Equation 5**

Where: 

𝐴 = 2𝑟2 +𝑥2𝐵

𝐵 = 2𝑟2𝑦𝐵

𝐶 = 𝑟2 2 + 𝑥𝐵 2 + 𝑦𝐵 2 = −𝑟1 2

Now 𝜃2  can be calculated:

𝜃2± = 𝑎𝑡𝑎𝑛2(𝐵, 𝐴) + 𝑎𝑡𝑎𝑛2(±√[1 − (𝐶/𝑅 ) 2 ], 𝐶/𝑅 )

**Equation 6**

Where:

𝑅 = √(𝐴2 + 𝐵2)

𝜃1± = 𝑎𝑡𝑎𝑛2[(𝑦𝐵 − 𝑟2𝑠𝑖𝑛𝜃2 ), (𝑥𝐵 − 𝑟2𝑐𝑜𝑠𝜃2 )]

**Equation 7**


#### The Velocity Analysis

The angular velocity can now be calculated using both **Equation 1** and **Equation 2** from above differentiating with respect to time:

dot_𝜃̇1 = 𝑢𝐵𝑐𝑜𝑠𝜃2 + 𝑣𝐵𝑠𝑖𝑛𝜃2/ 𝑟1sin(𝜃2 − 𝜃1)

dot_𝜃̇2 = 𝑢𝐵𝑐𝑜𝑠𝜃1 + 𝑣𝐵𝑠𝑖𝑛𝜃1/ 𝑟2 sin(𝜃1 − 𝜃2 )

### MATLAB Code of Two bar link

#### Variable declaration
```
r1=0.3;
r2=0.2;
YB=sqrt(2);
i=0;
XB=-YB;

for X=0.3:-0.003:0;
    Y= -X+0.3;
    A=2*r2*X;
    B=2*r2*Y;
    C=((r2)^2)+(X^2)+(Y^2)-((r1)^2);
    R=sqrt((A^2)+(B^2));
    Z=C/R;
    zz=sqrt(1-(Z^2));
    i=i+1;
```
#### Position Analysis
```
TH2=atan2(B,A)+atan2(zz,Z);
if TH2<0; TH2=TH2+2*pi;end

TH2b=atan2(B,A)-atan2(zz,Z);
if TH2b<0; TH2b=TH2b+2*pi;end

TH1=atan2((Y-r2*sin (TH2)), (X-r2*cos (TH2)));
T1(i)=TH1; T2(i)=TH2; T2b(i)=TH2b;
```
#### Velocity analysis
```
w1=((XB*cos (TH2)) + (YB*sin (TH2)))/(r1*sin (TH2-TH1));
w2=((XB*cos (TH1)) + (YB*sin (TH1)))/(r2*sin (TH1-TH2));

W1 (i)=w1;
W2 (i)=w2;
```
### NX modelling of Two bar link

The two-link bar manipulator was modelled on Siemens NX software in order to carry out a motion simulation of the arm.
To create the two-bar link manipulator, assembly components with the appropriate parameters were modelled.

#### The Base

![image](https://user-images.githubusercontent.com/73448401/99854625-0d5c6f00-2b7d-11eb-9776-be0b9ff7409f.png)

#### Link OA

![image](https://user-images.githubusercontent.com/73448401/99854633-11888c80-2b7d-11eb-82a0-7afa834c8fcb.png)

#### Link AB

![image](https://user-images.githubusercontent.com/73448401/99854643-177e6d80-2b7d-11eb-9395-b4d254581273.png)

#### The Actuator

![image](https://user-images.githubusercontent.com/73448401/99854652-1f3e1200-2b7d-11eb-8be2-510a7ca041bd.png)

#### The completed assembly in a motion simulation

![image](https://user-images.githubusercontent.com/73448401/99854661-27964d00-2b7d-11eb-9d5b-5543e282546b.png)


 
## Four bar link mechanism  

The four-bar link mechanism shown **Figure 7** in consists of three links, link AB, BC, CD and DA which represents the ground. Link AB is driven by a motor with the torque force Tm starting the movement in the mechanism, CD then carries the load torque Tl. A counter-clockwise direction is taken in a horizontal axis to calculate the angles. 

![image](https://user-images.githubusercontent.com/73448401/99855716-53b2cd80-2b7f-11eb-8c4b-f646eb2a0b0e.png)

**Figure 7** :Four bar linked mechanism

### Mathematical modelling of Four-bar link

Before carrying out the simulation, a mathematical model of the system needs to be developed.

The parameters given of the four-bar link system are the following:

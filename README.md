# Design and Analysis of 2 and 4 bar mechanisms

This project consisted of using both MATLAB and Siemens NX  to carry out simulations of mechanism systems.

- [What is this?](#what-is-this)
- [Method](#method)
  * [Two bar link mechanism](#two-bar-link-mechanism)
    + [Mathematical modelling of Two bar link](#mathematical-modelling-of-two-bar-link)
    + [MATLAB Code of Two bar link](#matlab-code-of-two-bar-link)
    + [NX modelling of Two bar link](#nx-modelling-of-two-bar-link)
  * [Four bar link mechanism](#four-bar-link-mechanism)
    + [Mathematical modelling of Four-bar link](#mathematical-modelling-of-four-bar-link)
    + [MATLAB Code of Four-bar link](#matlab-code-of-four-bar-link)
    + [NX modelling of Four bar link](#nx-modelling-of-four-bar-link)
- [Results](#results)
  * [MATLAB results for Two bar link mechanism](#matlab-results-for-two-bar-link-mechanism)
  * [MATLAB results for Four-bar link mechanism](#matlab-results-for-four-bar-link-mechanism)
  * [NX simulation results for Two bar link mechanism](#nx-simulation-results-for-two-bar-link-mechanism)
  * [NX simulation results for Four-bar link mechanism](#nx-simulation-results-for-four-bar-link-mechanism)
- [Thoughts](#thoughts)
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

### The Position Analysis

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


### The Velocity Analysis

The angular velocity can now be calculated using both **Equation 1** and **Equation 2** from above differentiating with respect to time:

dot_𝜃̇1 = 𝑢𝐵𝑐𝑜𝑠𝜃2 + 𝑣𝐵𝑠𝑖𝑛𝜃2/ 𝑟1sin(𝜃2 − 𝜃1)

dot_𝜃̇2 = 𝑢𝐵𝑐𝑜𝑠𝜃1 + 𝑣𝐵𝑠𝑖𝑛𝜃1/ 𝑟2 sin(𝜃1 − 𝜃2 )

### MATLAB Code of Two bar link

### Variable declaration
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
### Position Analysis
```
TH2=atan2(B,A)+atan2(zz,Z);
if TH2<0; TH2=TH2+2*pi;end

TH2b=atan2(B,A)-atan2(zz,Z);
if TH2b<0; TH2b=TH2b+2*pi;end

TH1=atan2((Y-r2*sin (TH2)), (X-r2*cos (TH2)));
T1(i)=TH1; T2(i)=TH2; T2b(i)=TH2b;
```
### Velocity analysis
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

**Figure 2**

#### Link OA

![image](https://user-images.githubusercontent.com/73448401/99854633-11888c80-2b7d-11eb-82a0-7afa834c8fcb.png)

**Figure 3**

#### Link AB

![image](https://user-images.githubusercontent.com/73448401/99854643-177e6d80-2b7d-11eb-9395-b4d254581273.png)

**Figure 4**

#### The Actuator

![image](https://user-images.githubusercontent.com/73448401/99854652-1f3e1200-2b7d-11eb-8be2-510a7ca041bd.png)

**Figure 5**

#### The completed assembly in a motion simulation

![image](https://user-images.githubusercontent.com/73448401/99854661-27964d00-2b7d-11eb-9d5b-5543e282546b.png)

**Figure 6**
 
## Four bar link mechanism  

The four-bar link mechanism shown **Figure 7** in consists of three links, link *AB, BC, CD* and *DA* which represents the ground. Link *AB* is driven by a motor with the torque force Tm starting the movement in the mechanism, *CD* then carries the load torque Tl. A counter-clockwise direction is taken in a horizontal axis to calculate the angles. 

![image](https://user-images.githubusercontent.com/73448401/99855716-53b2cd80-2b7f-11eb-8c4b-f646eb2a0b0e.png)

**Figure 7** :Four bar linked mechanism

### Mathematical modelling of Four-bar link

Before carrying out the simulation, a mathematical model of the system needs to be developed.

The parameters given of the four-bar link system are the following:


|     LINK    |     MASS (kg)    |     LENGTH (mm)    |     INERTIA(Kg.m2)    |     rG (mm)    |
|-------------|------------------|--------------------|-----------------------|----------------|
|     AB      |     0.2          |     10             |     0.00001           |     5          |
|     BC      |     0.4          |     35             |     0.004             |     17.5       |
|     CD      |     0.4          |     20             |     0.00008           |     15         |
|     DA      |     -            |     30             |     -                 |     -          |

**Table 1**: Tables of parameters for the four-bar linked mechanism

A mathematical analysis will be performed to obtain equations that describe the system.

### The Position Analysis

𝑟1𝑐𝑜𝑠𝜃1 + 𝑟2𝑐𝑜𝑠𝜃2 + 𝑟3𝑐𝑜𝑠𝜃3 + 𝑟4𝑐𝑜𝑠𝜃4 = 0

𝑟1 sin 𝜃1 + 𝑟2𝑠𝑖𝑛𝜃2 + 𝑟3𝑠𝑖𝑛𝜃3 + 𝑟4𝑠𝑖𝑛𝜃4 = 0

Since 4 = 180:

𝑐𝑜𝑠𝜃4 = −1 and 𝑠𝑖𝑛𝜃4 = 0

Giving the equations:

𝑟2𝑐𝑜𝑠𝜃2 = 𝑟4 = 𝑟4 − (𝑟1𝑐𝑜𝑠𝜃1 + 𝑟3𝑐𝑜𝑠𝜃3)

𝑟2𝑠𝑖𝑛𝜃2 = −(𝑟1 sin 𝜃1 + 𝑟3sin 𝜃3)

By squaring and adding up both sides of the equations, the following equations are obtained:

𝑟2 2 = 𝑟4 2 − 2𝑟4(𝑟1𝑐𝑜𝑠𝜃1 + 𝑟3𝑐𝑜𝑠𝜃3) +(𝑟1𝑐𝑜𝑠𝜃1 + 𝑟3𝑐𝑜𝑠𝜃3 ) 2

𝑟2 2 = 𝑟4 2 − 2𝑟1𝑟4 cos 𝜃1 − 2𝑟3𝑟4𝑐𝑜𝑠𝜃3 + 𝑟1 2 𝑐𝑜𝑠 2𝜃1 + 2𝑟1𝑟3𝑐𝑜𝑠𝜃1𝑐𝑜𝑠𝜃3 + 𝑟3 2 cos2 𝜃3 + 𝑟1 2 𝑐𝑜𝑠 2𝜃1 + 2𝑟1𝑟3𝑠𝑖𝑛𝜃1𝑠𝑖𝑛𝜃3 + 𝑟3 2 sin2 𝜃3

Therefore: 

𝐴 cosθ3 + 𝐵 𝑠𝑖𝑛𝜃3 = 𝐶

Where:

𝐴 = 𝑐𝑜𝑠𝜃1 − ( 𝑟4 𝑟1 )

𝐵 = 𝑠𝑖𝑛𝜃1

𝐶 = ( 𝑟4 𝑟3 ) 𝑐𝑜𝑠𝜃1 − (𝑟1 2 − 𝑟2 2 + 𝑟3 2 + 𝑟4 2 ) (2𝑟1𝑟3)

With the solution to equation being:

𝜃3 ± 𝑎𝑡𝑎𝑛2(𝐵, 𝐴) + 𝑎𝑡𝑎𝑛2 ((± √1 − [( 𝐶 𝑅 ) 2 ]), 𝐶 𝑅 )

Where: 

𝑅 = √𝐴2 + 𝑏 2

### Link Position 

For MATLAB to be able to produce results the XY position of each link needs to be calculated.
Link AB:

𝑥𝑔1 = 𝑟𝑔1 𝑐𝑜𝑠𝜃1

𝑦𝑔1 = 𝑟𝑔1 𝑠𝑖𝑛𝜃1

Link BC:

𝑥𝑔2 = 𝑟1 cos 𝜃1 + 𝑟𝑔2 𝑐𝑜𝑠𝜃2

𝑦𝑔2 = 𝑟1𝑠𝑖𝑛𝜃1 + 𝑟𝑔2 𝑠𝑖𝑛𝜃2

Link CD:

𝑥𝑔3 = 𝑟4 − (𝑟3 − 𝑟𝑔3 ) 𝑐𝑜𝑠𝜃3

𝑦𝑔3 = − (𝑟3 − 𝑟𝑔3 ) 𝑠𝑖𝑛𝜃3

### The Velocity analysis

To analyse the angular velocity to the derivative of Equation 3 and Equation 4 are carried out, giving the following:

𝜃̇ 3 = 𝜃̇ 1 = 𝑟1 sin(𝜃1 − 𝜃2) 𝑟3sin(𝜃2 − 𝜃3)

𝜃̇ 2 = 𝜃̇ 1 = 𝑟1 sin(𝜃3 − 𝜃1 𝑟2sin(𝜃2 − 𝜃3)

### The Acceleration Analysis

To calculate the angular acceleration, the derivative of the equations above in the velocity analysis can be taken to obtain:

𝜃3 ̈ = 𝜃̇ 1 𝑟1 𝑟3 ̈ cos(𝜃1 − 𝜃2 ) sin(𝜃2 − 𝜃3 )(𝜃̇ 1 − 𝜃̇ 2) − sin(𝜃1 − 𝜃2 ) cos(𝜃2 − 𝜃3)(𝜃̇ 2 − 𝜃3) sin2(𝜃2 − 𝜃3 )

𝜃2 ̈ = 𝜃̇ 1 𝑟1 𝑟2 ̈ cos(𝜃3 − 𝜃1 ) sin(𝜃2 − 𝜃3 )(𝜃̇ 3 − 𝜃̇ 1) − sin(𝜃3 − 𝜃1 ) cos(𝜃2 − 𝜃3)(𝜃̇ 2 − 𝜃3) sin2(𝜃2 − 𝜃3 )

### Centre of mass acceleration

The force conditions on points A, B, C and D need to be calculated to obtain the centre of mass acceleration:

𝑥̈𝑔1 = −𝑟𝑔1 (𝜃1 ̈ sin 𝜃1 + 𝜃1 ̇ ̈ 2 cos 𝜃1)

𝑦̈𝑔1 = −𝑟𝑔1 (𝜃1 ̈ cos 𝜃1 + 𝜃1 ̇ 2 sin 𝜃1)

𝑥̈𝑔2 = −𝑟1(𝜃1 ̈ cos 𝜃1 + 𝜃1 ̇ 2 cos 𝜃1) − 𝑟𝑔2(𝜃̈ 2 𝑠𝑖𝑛 𝜃2 + 𝜃1 ̇ 2 cos 𝜃2)

𝑦̈𝑔2 = −𝑟1(𝜃1 ̈ cos 𝜃1 + 𝜃1 ̇ 2 sin 𝜃1) − 𝑟𝑔2(𝜃̈ 2 𝑐𝑜𝑠 𝜃2 + 𝜃1 ̇ 2 sin 𝜃2)

𝑥̈𝑔3 = (𝑟3 − 𝑟𝑔3 )(𝜃̈ 3𝑠𝑖𝑛𝜃3 + 𝜃3 ̇ 2 𝑐𝑜𝑠𝜃3)

𝑥̈𝑔3 = (𝑟3 − 𝑟𝑔3 )(𝜃̈ 3𝑠𝑖𝑛𝜃3 + 𝜃3 ̇ 2 𝑐𝑜𝑠𝜃3)

### Dynamic Analysis 

The forces, as well as the torque acting in both the XY direction in links AB, BC, and CD need to be calculated individually to carry out a dynamic analysis.

### Dynamic analysis for link *AB*:

![image](https://user-images.githubusercontent.com/73448401/99856299-92955300-2b80-11eb-9686-247bc59e2fd6.png)

**Figure 8**: Link AB

𝑋𝐴 + 𝑋𝐵 = 𝑚𝑥̈𝐺1

𝑌𝐴 + 𝑌𝐵 = 𝑚1𝑦̈𝐺1

𝑇𝑚 + 𝑋𝐴𝑟𝐺1 𝑠𝑖𝑛𝜃1 − 𝑌𝐴𝑟𝐺1 𝑐𝑜𝑠𝜃1 − 𝑋𝐵(𝑟1 − 𝑟𝐺1 )𝑠𝑖𝑛𝜃1 + 𝑌𝐵(𝑟1 − 𝑟𝐺1 )𝑐𝑜𝑠𝜃1 = 𝐼𝐺1 𝜃̈ 1

### Dynamic analysis for link *BC*:

![image](https://user-images.githubusercontent.com/73448401/99856304-94f7ad00-2b80-11eb-8522-68fdc204fcfd.png)
 
**Figure 9**: Link BC

−𝑋𝐵 + 𝑋𝐶 = 𝑚2𝑥̈𝐺2

−𝑌𝐵 + 𝑌𝐶 = 𝑚2𝑦̈𝐺2

−𝑋𝐵𝑟𝐺2 𝑠𝑖𝑛𝜃2 + 𝑌𝐵𝑟𝐺2 𝑐𝑜𝑠𝜃2 − 𝑋𝑐(𝑟2 − 𝑟𝐺2 )𝑠𝑖𝑛𝜃2 + 𝑌𝑐(𝑟2 − 𝑟𝐺2 )𝑐𝑜𝑠𝜃2 = 𝐼𝐺1 𝜃̈ 2

### Dynamic analysis for link *CD*:

![image](https://user-images.githubusercontent.com/73448401/99856309-97f29d80-2b80-11eb-8bb2-8a16eb6dc156.png)
 
**Figure 10**: Link CD

−𝑋𝐶 + 𝑋𝐷 = 𝑚2𝑥̈𝐺3

−𝑌𝐶 + 𝑌𝐷 = 𝑚2𝑦̈𝐺3

−𝑇1 − 𝑋𝐶𝑟𝑔3 𝑠𝑖𝑛𝜃3 + 𝑌𝑐𝑟𝐺3𝑐𝑜𝑠𝜃3 − 𝑋𝐷 (𝑟3 − 𝑟𝑔3 ) 𝑠𝑖𝑛𝜃3 + 𝑌𝐷(𝑟3 − 𝑟𝐺3 )𝑠𝑖𝑛𝜃3 = 𝐼𝐺3 𝜃̈ 3

### MATLAB Code of Four-bar link

#### Varable declaration
```
r1=0.01;
r2=0.035;
r3=0.02;
r4=0.03;
rg1=r1/2;
rg2=r2/2;
rg3=r3/2;

ig1=0.00001;
ig2=0.0004;
ig3=0.00008;

w1=100;

m1=0.2;
m2=0.6;
m3=0.4;
a1=0;
i=0;

for TH1=0:0.001:2*pi
 A=cos(TH1)-(r4/r1);
 B=sin(TH1);
 C=(r4/r3)*cos(TH1)-((r1^2-r2^2+r3^2+r4^2)/(2*r1*r3));
 R=sqrt(A^2+B^2);
 Z=C/R;
 zz=sqrt(1-Z^2);
 i=i+1;
 ```
### Position analysis
```
TH3=atan2(B,A)+atan2(zz,Z);
if TH3<0; TH3=TH3+2*pi;end

TH3b=atan2(B,A)-atan2(zz,Z);
if TH3b<0; TH3b=TH3b+2*pi;end

TH2=atan2((-r3*sin(TH3)-r1*sin(TH1)),(r4-r3*cos(TH3)-r1*cos(TH1)));

T1(i)=TH1; T2(i)=TH2; T3(i)=TH3; T3b(i)=TH3b;
```
### Velocity analysis
```
w3=w1*(r1*sin(TH1-TH2))/(r3*sin(TH2-TH3));
w2=w1*(r1*sin(TH3-TH1))/(r2*sin(TH2-TH3));

W3(i)=w3; W2(i)=w2;
```
### Acceleration analysis
```
a3=(w1^2*r1/r3)*((1-(w2/w1))*cos(TH1-TH2)*sin(TH2-TH3)-((w2/w1)-(w3/w1))*cos(TH2-TH3)*sin(TH1-TH2))/(sin(TH2-TH3))^2;
a2=-(w1^2*r1/r2)*((1-(w3/w1))*cos(TH1-TH3)*sin(TH2-TH3)-((w2/w1)-(w3/w1))*cos(TH2-TH3)*sin(TH1-TH3))/(sin(TH2-TH3))^2;

A3(i)=a3; A2(i)=a2;
```
### Acceleration G1,G2, G3
```
xg1= -rg1* (a1*sin(TH1) +w1^2*cos (TH1));
yg1= rg1* (a1*cos (TH1) -w1^2*sin (TH1));

xg2= -r1* (a1*sin (TH1) +w1^2*cos (TH1))- rg2* (a2*sin (TH2) +w2^2*cos(TH2));
yg2= r1* (a1*cos (TH1) -w1^2*sin (TH1))+ rg2* (a2*cos (TH2)-w2^2*sin (TH2));

xg3= (r3-rg3)*(a3*sin(TH3)+w3^2*cos(TH3));
yg3= -(r3-rg3)*(a3*cos(TH3)-w3^2*sin(TH3));
```
### MATRIX for dynamic analysis

Matrices can now be used to solve the dynamic equations used above. The matrix will be written in the form:

[𝐴] 𝑋 [𝐵] = [X]

Where:

A= is the multiplying variable of the instantaneous geometry of the mechanism

B= is the multiplying variable defines the velocity’s and acceleration links

X= The sum of the multiplying variables A and B and where the plot for the MATLAB results will be obtained from.

### Dynamic Analysis
```
A=[1 0 1 0 0 0 0 0 0;
   0 1 0 1 0 0 0 0 0;
   rg1*sin(TH1) -rg1*cos(TH1) -(r1-rg1)*sin(TH1) (r1-rg1)*cos(TH1) 0 0 0 0 1;
   0 0 -1 0 1 0 0 0 0;
   0 0 0 -1 0 1 0 0 0;
   0 0 -rg2*sin(TH2) rg2*cos(TH2) -(r2-rg2)*sin(TH2) (r2-rg2)*cos(TH2) 0 0 0;
   0 0 0 0 -1 0 1 0 0;
   0 0 0 0 0 -1 0 1 0;
   0 0 0 0 -rg3*sin(TH3) rg3*cos(TH3) -(r3-rg3)*sin(TH3) (r3-rg3)*cos(TH3) 0];


B =[ m1*xg1;
     m1*yg1;
     ig1*a1;
     m2*xg2;
     m2*yg2;
     ig2*a2;
     m3*xg3;
     m3*yg3;
     ig3*a3];


X=inv(A)*B ;
XA (i)=X(1,1);
YA (i)=X(2,1);
XB (i)=X(3,1);
YB (i)=X(4,1);
XC (i)=X(5,1);
YC (i)=X(6,1);
XD (i)=X(7,1);
YD (i)=X(8,1);
TM (i)=X(9,1);
```

### NX modelling of Four bar link

To create the four bar-linked mechanism for links part models shown in **Figure 11-Figure 14** had to be created in NX which would then be assembled into the mechanism
 
![image](https://user-images.githubusercontent.com/73448401/99856897-eeaca700-2b81-11eb-9c0e-32c137320d53.png)

**Figure 11**: Link AB part

![image](https://user-images.githubusercontent.com/73448401/99856905-f409f180-2b81-11eb-998a-c3a4a4dca16a.png)

**Figure 12**: Link AD part
 
![image](https://user-images.githubusercontent.com/73448401/99856910-f9673c00-2b81-11eb-9f6b-84d26c4cb61d.png)

**Figure 13**: Link BC part

![image](https://user-images.githubusercontent.com/73448401/99856919-fff5b380-2b81-11eb-9658-e57873b5c614.png)

**Figure 14**: Links CD part

**Figure 15** shows the four-bar linked mechanism assembled and an emotion simulation. The joints parameters featured for each link have the appropriate features such as the revolute and the slider. Link AD simulated to be the ground and is set in an always stationary position. Link AB is the moving force and the mechanism and rotates counterclockwise at an angular velocity of 100 rads/s.

![image](https://user-images.githubusercontent.com/73448401/99856922-03893a80-2b82-11eb-90f2-39f89614c44b.png)

**Figure 15**: Completed assembly in motion simulation

# Results

## MATLAB results for Two bar link mechanism

![image](https://user-images.githubusercontent.com/73448401/99860188-3fc09900-2b8a-11eb-8473-7355ae9f5ab4.png)

**Figure 16**: Variation of link orientations

**Figure 16** above shows variation of link orientation with the angle’s theta 1 and theta 2. It is seen that both angles are positive, as they rotate along the excesses in an anticlockwise direction. Theta one begins above -50 degrees and increases to an angle of approximately 50 degrees indicating a continuous upward direction. Theta two, on the other hand, starts in a positive position and begins to increase to points beyond 150 degrees steadily.

![image](https://user-images.githubusercontent.com/73448401/99860194-451de380-2b8a-11eb-823e-c339de84433d.png)

**Figure 17**: Variation of angular velocity

**Figure 17** shows the variation of angular velocity for the 21. It is shown that the mega one begins a lower place than omega one at around 1 rad/sec, with omega two starting above 10 rad/sec. An increase in velocity is noticed in the second angle when in comparison to the first this is due to rapid acceleration. The first angular velocity has lower peak point in the second angular velocity, but the second angular velocity sees a sharp decrease of this peak is reached when compared to the first angular velocity.

## MATLAB results for Four-bar link mechanism


![image](https://user-images.githubusercontent.com/73448401/99862873-6f27d380-2b93-11eb-92e9-ad1fa3289224.png)

**Figure 18**: Polar load diagram for joint A

![image](https://user-images.githubusercontent.com/73448401/99862875-718a2d80-2b93-11eb-9a44-1e004af7170c.png)

**Figure 19**:Polar load diagram for joint B

![image](https://user-images.githubusercontent.com/73448401/99862879-75b64b00-2b93-11eb-8b8c-9ddf8aa3becd.png)

**Figure 20**:Polar load diagram for joint C

![image](https://user-images.githubusercontent.com/73448401/99862884-79e26880-2b93-11eb-9ef1-99393933b507.png)

**Figure 21**: Polar load diagram for joint D

**Figure 18-Figure 21** shows the polar loads of joints *A, B, C and D* and is the result of the dynamic analysis of all the forces. It is apparent that **Figure 18** and  **Figure 19** a very similar in creating perhaps most joints having the same magnitude while moving with the constant velocity. The same can be said for joints *C* and *D*.

![image](https://user-images.githubusercontent.com/73448401/99863010-1147bb80-2b94-11eb-8ae5-fbd90a27919b.png)

**Figure 22**:Variation of motor torque

**Figure 22** above shows the variation when a torque is applied to joints *A* and *B*(see **Figure 8**).At each cycle of the mechanism there is an increase in the torque of the motor and the angular velocity is constant. As the link moves energy is stored in the link and when the energy generated from the torque of the motor is zero, the energy stored in the link returns to the motor and vice versa. This explains the fluctuation of the peaks shown for the torque above.

## NX simulation results for Two bar link mechanism

![image](https://user-images.githubusercontent.com/73448401/99887259-c46af000-2c3a-11eb-9081-f08622908274.png)

**Figure 23**: Variation of angular velocity

**Figure 23** shows the variation of the link angular velocity, and when compared to the results produced from the MATLAB plot, the results are the same except the that the angular velocity values are positive due to NX not providing negative values.

## NX simulation results for Four-bar link mechanism

![image](https://user-images.githubusercontent.com/73448401/99887271-db114700-2c3a-11eb-8336-d54624f4f1e4.png)

**Figure 24**: Polar load diagram results for joint A in NX

![image](https://user-images.githubusercontent.com/73448401/99887277-e19fbe80-2c3a-11eb-976e-f3b31b7e7e61.png)

**Figure 25**:Polar load diagram results for joint B in NX

![image](https://user-images.githubusercontent.com/73448401/99887278-e5334580-2c3a-11eb-828f-69c60b576130.png)

**Figure 24-Figure 26** show a close resemblance to Figure 19-Figure 21, but the magnitudes shifted slightly indicating an orientation or fault during the NX modelling process.

**Figure 26**:Polar load diagram results for joint C in NX

![image](https://user-images.githubusercontent.com/73448401/99887280-e8c6cc80-2c3a-11eb-8cf8-5cee41551dc1.png)

**Figure 27**:Polar load diagram results for joint D in NX

# Thoughts

The simpler of the two methods was the modelling method using MATLAB. After creating the parts in NX and assembling it to create both the two bar and the four-bar mechanisms, setting up the joint parameters was fairly simple, but problems occurred during the orientation of the assembly during the motion simulation process this resulted in graphs that was similar compared to the MATLAB counterpart but was not correct.
To conclude both methods (MATLAB and NX) were valuable for carrying out the dynamics and kinematic analysis of a mechanism.


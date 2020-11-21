%% Varable declaration 
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

%% Position analysis

TH3=atan2(B,A)+atan2(zz,Z);
if TH3<0; TH3=TH3+2*pi;end

TH3b=atan2(B,A)-atan2(zz,Z);
if TH3b<0; TH3b=TH3b+2*pi;end

TH2=atan2((-r3*sin(TH3)-r1*sin(TH1)),(r4-r3*cos(TH3)-r1*cos(TH1)));

T1(i)=TH1; T2(i)=TH2; T3(i)=TH3; T3b(i)=TH3b;

%% Velocity analysis

w3=w1*(r1*sin(TH1-TH2))/(r3*sin(TH2-TH3));
w2=w1*(r1*sin(TH3-TH1))/(r2*sin(TH2-TH3));

W3(i)=w3; W2(i)=w2;

%% Acceleration analysis

a3=(w1^2*r1/r3)*((1-(w2/w1))*cos(TH1-TH2)*sin(TH2-TH3)-((w2/w1)-(w3/w1))*cos(TH2-TH3)*sin(TH1-TH2))/(sin(TH2-TH3))^2;
a2=-(w1^2*r1/r2)*((1-(w3/w1))*cos(TH1-TH3)*sin(TH2-TH3)-((w2/w1)-(w3/w1))*cos(TH2-TH3)*sin(TH1-TH3))/(sin(TH2-TH3))^2;

A3(i)=a3; A2(i)=a2;


%% Acceleration G1,G2, G3
xg1= -rg1* (a1*sin(TH1) +w1^2*cos (TH1)); 
yg1= rg1* (a1*cos (TH1) -w1^2*sin (TH1));

xg2= -r1* (a1*sin (TH1) +w1^2*cos (TH1))- rg2* (a2*sin (TH2) +w2^2*cos(TH2)); 
yg2= r1* (a1*cos (TH1) -w1^2*sin (TH1))+ rg2* (a2*cos (TH2)-w2^2*sin (TH2));

xg3= (r3-rg3)*(a3*sin(TH3)+w3^2*cos(TH3));
yg3= -(r3-rg3)*(a3*cos(TH3)-w3^2*sin(TH3));

%% Dynamic Analysis
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

end

%Plot of joint A 
figure (1)
plot (XA, YA) 
grid
title ('Polar Load Diagram for joint A') 
xlabel('Fx,N') 
ylabel('Fy,N'); 


% Plot of joint B 
figure (2) 
plot (XB, YB) 
grid 
title('Polar Load Diagram for joint B') 
xlabel('Fx,N') 
ylabel('Fy,N'); 


% Plot of joint C 
figure (3) 
plot (XC, YC)
grid
title('Polar Load Diagram for joint C') 
xlabel('Fx,N') 
ylabel('Fy,N'); 


% Plot of joint D 
figure (4) 
plot (XD, YD)
grid
title('Polar Load Diagram for joint D') 
xlabel('Fx,N') 
ylabel('Fy,N'); 

% Plot of Motor Torque 
figure (5) 
plot (T1*180/pi,TM)
grid
title('Variation of motor torque') 
xlabel('\Theta 1,deg') 
ylabel('Tm,N.m'); 

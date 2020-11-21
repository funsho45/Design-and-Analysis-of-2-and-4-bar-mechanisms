%% Variable declaration
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

%% Position Analysis

TH2=atan2(B,A)+atan2(zz,Z);
if TH2<0; TH2=TH2+2*pi;end

TH2b=atan2(B,A)-atan2(zz,Z);
if TH2b<0; TH2b=TH2b+2*pi;end

TH1=atan2((Y-r2*sin (TH2)), (X-r2*cos (TH2)));
T1(i)=TH1; T2(i)=TH2; T2b(i)=TH2b;




%% Velocity analysis
w1=((XB*cos (TH2)) + (YB*sin (TH2)))/(r1*sin (TH2-TH1)); 
w2=((XB*cos (TH1)) + (YB*sin (TH1)))/(r2*sin (TH1-TH2)); 
W1 (i)=w1; 
W2 (i)=w2;

end

%% Plot results 

figure (1) 
plot (T1*180/pi); 
hold on 
plot (T2*180/pi); 
grid; 
title('Variation of link orientations')
xlabel('y_B (m)') 
ylabel('\Theta (degree)'); 
legend('\Theta_1','\Theta_2'); 
xlim ( [0 100]) 
ylim([-50 200]) 

%Plot of angular velocity - Thetal and Theta2
figure (2) 
plot (W1); 
hold on
plot (W2); 
grid 
title('Variation of angular velocity') 
xlabel('y_B (m)') 
ylabel('\omega (rad/sec)'); 
legend('\omega 1', '\omega 2');
xlim ( [0 100]) 
ylim([-3 14]) 

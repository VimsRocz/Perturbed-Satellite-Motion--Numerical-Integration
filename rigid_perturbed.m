function dy = rigid_perturbed(t,y)
dy = zeros(6,1);
c20=-0.00108263;
GM=398600.44;
a_e=6378; 
%Position
xx=y(1);
yy=y(2);
zz=y(3);
%Radius
r=(xx.^2+yy.^2+zz.^2).^0.5;

%%Change this section according to the formulas
%%You can compear this to the formulas from exe4 to properly set formulas
%%from exe 5

%%For task 1 and 2 you will need to make different dy so for each task use
%%seperate numerical integrator file (in this case it called
%%rigid_perturbed). So you will need to make 2 different copyes of this
%%file with small adjustments in dy part 
%dX/dt
dy(1)=y(4); %vx this is first derivative
dy(4)=-GM.*xx.*r.^-3*(1-3/2*c20.*(a_e/r)^2*(5*(zz/r)^2-1)); %ax this is second derivative 

%dY/dt
dy(2)=y(5); %vy
dy(5)=-GM.*yy.*r.^-3*(1-3/2*c20*(a_e/r)^2*(5*(zz/r)^2-1)); %ay

%dZ/dt
dy(3)=y(6); %vz
dy(6)=-GM.*zz.*r.^-3*(1-3/2*c20*(a_e/r)^2*(5*(zz/r)^2-3)); %az
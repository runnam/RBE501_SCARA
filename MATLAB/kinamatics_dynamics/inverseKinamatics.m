%{
  Nathaniel Goldfarb
 

  inverseKinamatics
  Calculate the invearse kinamatics for the SCARA manipulator
  Arugments:
  pos: 1x3 matrix of X,Y,Z positions 
  RETURN:
   angles: 1x3 matrix of joint angles for the servos (z=z)
%}

%%%MAKE INVAILD CHEACK HERE

function [ angle ] =  inverseKinamatics( x,y ,z)


x2 = x;
y2 = y;
z2= z;

a1 = 5.24;
%Have to add two to account for the offset of the prismatic link
a2=a1 + 2;
if(abs(x) > 12.48 || abs(y) > 12.48 || sqrt( x^2 + y^2 ) >12.48 )
    angle = [0 0 0];
    return;
end

if( x == 0 && y ==0)
     angle = [0 0 0];
    return;
end
    

theta2Temp = -acosd( (x2^2 + y2^2 - a1^2 - a2^2)/(2*a1*a2));

%If theta2 rotates more then 180 degrees
%set theta2 to "real" degree but use theta2Temp to find theta1 and theta3

if(theta2Temp<180)
    theta2 = 360-theta2Temp;
else
    theta2 = theta2Temp;
end

%Get theta 1
theta1= atan2d(y2,x2)- atan2d( (a2*sind(theta2)),(a1 + a2*cosd(theta2)));

format short;
angle = ([round(theta1),round(theta2),round(z)]);
for ii = 1 :2
    
    if( angle(ii) > 180)
        angle(ii) = angle(ii)-360;
    elseif(angle(ii)<-180)
        angle(ii) = angle(ii)+360;
    end
end
  disp( angle)

if( angle(1) < -120 || angle(1) > 270)
    angle = [0 0 0];
    
end

if(angle(2) >300)
    angle = [0 0 0];
end

 
end


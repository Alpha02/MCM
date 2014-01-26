function [u_new ] = get_next_u( i,j,l,u )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ddx=u(i-1,j,l)-2*u(i,j,l)+u(i+1,j,l);
ddy=u(i,j-1,l)-2*u(i,j,l)+u(i,j+1,l);
ddz=u(i,j,l-1)-2*u(i,j,l)+u(i,j,l+1);
r=0.01;
u_new=r*ddx+r*ddy+r*ddz+u(i,j,l);
end


function [  ] = Untitled6( x0,y0,r )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
alpha=0:pi*100/r:2*pi;
x=r*cos(alpha);
y=r*sin(alpha);
plot(x0+x,y0+y);
end


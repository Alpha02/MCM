function [ nn ] = out_of_area( x,y )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    if(x*x+y*y>11000^2)
        nn=1;
    else
        nn=0;
    end
end


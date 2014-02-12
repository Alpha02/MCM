function [ output_args ] = CalcCarTurningTime( turning_radius,car_speed )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    %output_args=0.137/car_speed;
    output_args =(0.81956*turning_radius + 7.1523)/car_speed;
    
end


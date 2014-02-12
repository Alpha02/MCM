function [val] = GetCarStyleProperty(idx_car,idx_property)

%GetCarProperty Summary of this function goes here
%   Detailed explanation goes here
    global car_table;
    val=car_table(idx_car,idx_property);
end

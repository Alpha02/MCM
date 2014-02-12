function [] = DrawCar(idx_car,idx_lane)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
    global CAR_TYPE;
    global CAR_POSITION;
    global PROP_LENGTH;
    global CAR_STATUS;
    global cars;
    my_type=cars(idx_car,CAR_TYPE);
    my_position=cars(idx_car,CAR_POSITION);
    my_length=GetCarStyleProperty(my_type,PROP_LENGTH);
    my_status=cars(idx_car,CAR_STATUS);
    rectangle('Position',[my_position-my_length,idx_lane+my_status/2,my_length,1]);
    

end


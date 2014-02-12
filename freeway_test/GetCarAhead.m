function [ target_car ] = GetCarAhead( idx_car )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    global CAR_POSITION;
    global CAR_LANE;
    global lanes;
    my_lane=GetCarProperty(idx_car,CAR_LANE);
    my_idx=find(lanes(my_lane,:)==idx_car);
    target_car=0;
    if(my_idx)

        if(my_idx==1)
            target_car=0;
        else
            target_car=lanes(my_lane,my_idx-1);
        end
    end
end


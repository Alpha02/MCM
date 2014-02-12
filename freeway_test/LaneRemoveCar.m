function [ output_args ] = LaneRemoveCar( idx_lane,idx_car)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    global CAR_POSITION;
    global CAR_LANE;
    global lanes;
    size_lanes=size(lanes);
    my_idx=find(lanes(idx_lane,:)==idx_car);
    if(my_idx)
        for idx2=my_idx:1:size_lanes(2)-1
            lanes(idx_lane,idx2)=lanes(idx_lane,idx2+1);
        end;
        lanes(idx_lane,size_lanes(2))=0;
    end;
end


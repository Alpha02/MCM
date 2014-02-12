function [ output_args ] = LaneAddCar( lane_idx,car_idx,car_position)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    global CAR_POSITION;
    global lanes;
    idx=1;
    size_lanes=size(lanes);
    while idx<=size_lanes(2)
        if (lanes(lane_idx,idx)==0)
            break;
        end;
        if(GetCarProperty(lanes(lane_idx,idx),CAR_POSITION)<car_position)
            break;
        end;
        idx=idx+1;
    end;
    for idx2=size_lanes(2)+1:-1:idx+1
        lanes(lane_idx,idx2)=lanes(lane_idx,idx2-1);
    end;
    lanes(lane_idx,idx)=car_idx;
    
end


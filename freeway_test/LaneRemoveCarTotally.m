function [ output_args ] = LaneRemoveCarTotally(idx_car)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    global CAR_POSITION;
    global CAR_LANE;
    global LANE_NUMBER;
    global lanes;
    global cars;
    size_lanes=size(lanes);
    for idx_lane=1:LANE_NUMBER
        my_idx=find(lanes(idx_lane,:)==idx_car);
        if(my_idx)
            for idx2=my_idx:1:size_lanes(2)-1
                lanes(idx_lane,idx2)=lanes(idx_lane,idx2+1);
            end;
            lanes(idx_lane,size_lanes(2))=0;
        end;
        for idx2=1:size_lanes(2)
            tmp= lanes(idx_lane,idx2);
            if tmp>idx_car
                lanes(idx_lane,idx2)=tmp-1;
            end;
        end;
    end;
end


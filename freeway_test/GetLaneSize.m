function [ idx ] = GetLaneSize( lane_idx )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    global lanes;
    idx=1;
    size_lanes=size(lanes);
    while idx<=size_lanes(2)
        if (lanes(lane_idx,idx)==0)
            break;
        end;
        idx=idx+1;
    end;
    idx=idx-1;
end


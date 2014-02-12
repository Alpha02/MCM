function [ output_args ] = free_lanes_memory()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    global lanes;
    global LANE_NUMBER;
    size_lanes=size(lanes);
    for i=1:size_lanes(2)
        if(lanes(:,i)==zeros(LANE_NUMBER,1))
            lanes(:,i:size_lanes(2))=[];
            break;
        end;
    end;

end


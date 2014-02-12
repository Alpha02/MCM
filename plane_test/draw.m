function [  ] = show_plane( plane_list )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    circle(0,0,10000);
    s=size(plane_list(:,:));
    for i=1:s(1)
        circle(plane_list(i,2),plane_list(i,3),800)
        
    end

end


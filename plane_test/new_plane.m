function [ plane_list] = new_plane( plane_list)
r_area=10000;

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    new_idx=size(plane_list(:,:));
    plane_list(new_idx(1)+1,1)=800;
    ang=rand()*2*pi;
    plane_list(new_idx(1)+1,2)=cos(ang)*r_area;
    plane_list(new_idx(1)+1,3)=sin(ang)*r_area;
    plane_list(new_idx(1)+1,4)=rand()*pi-pi/2+ang+pi;
end


function [ rt ] = calc( plane_list )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    s=size(plane_list(:,:));
    sum=0;
    for i=1:s(1)
        for j=1:s(1)
            if(i~=j)
                x1=plane_list(i,2);
                y1=plane_list(i,3);
                x2=plane_list(j,2);
                y2=plane_list(j,3);
                rr=(x1-x2)^2+(y1-y2)^2;
                if(rr<2000^2)
                    sum=sum+1;
                end
                rt=sum;
            end
        end
    end
    
    
end


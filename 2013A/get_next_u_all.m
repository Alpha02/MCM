function [ u_new ] = get_next_u_all( u )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
u_new=u;
    for i=2:length(u(:,1,1))-1
        for j=2:length(u(1,:,1))-1
            for l=2:length(u(1,1,:))-1
                u_new(i,j,l)=get_next_u(i,j,l,u);
            end
        end
    end
end


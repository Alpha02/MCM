function [ out_u ] = iterate_u( u,t )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    new_u(:,:,:,1)=get_next_u_all(u(:,:,:));
    for i=2:t
        new_u(:,:,:,i)=get_next_u_all(new_u(:,:,:,i-1));
    end
    out_u=new_u(:,:,:,t);
end


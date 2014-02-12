function [ ] = step( plane_list)
    plane_speed=300;

    hold on;
    
    record(1)=0;
    for j=1:1000
        figure(1);
        cla();

        x=rand();
        if(x<0.1)
            plane_list=new_plane(plane_list);
        end
        s=size(plane_list(:,:));
        i=1;
        while i<s(1)
            i=i+1;
            plane_list(i,2)=plane_list(i,2)+plane_speed*cos(plane_list(i,4));
            plane_list(i,3)=plane_list(i,3)+plane_speed*sin(plane_list(i,4));
            if(out_of_area(plane_list(i,2),plane_list(i,3))==1)
                plane_list(i,:)=[];
                s(1)=s(1)-1;
                i=i-1;
            end
        end

        draw(plane_list);
        pause(0.01);
        sss=size(record);
        record(sss(2)+1)=calc(plane_list);
        if(sss(2)+1>200)
            record(1)=[];
        end
        figure(2);
        hold off;
        plot(record);
        
        pause(0.01);

    end
end
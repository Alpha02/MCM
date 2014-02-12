function [] = SystemRefresh(time,traffic_flow,random_rule)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
    global lanes;
    global cars;
    global CAR_ROUND_END;
    global CAR_LANE;
    global LANE_NUMBER;
    global CAR_POSITION;
    global CAR_STATUS;
    global statis_time;
 
    global statis_jam;
    global statis_bump;
    global statis_change;
    global statis_all_speed;
    
    global statis_average_jam;
    global statis_average_bump;
    global statis_average_change;
    global statis_average_speed;
    global statis_average_speed_on_road;
    global statis_type;
    
    global statis_pass;
    global statis_average_pass;    
    global car_waiting;   
    global average_car_waiting; 
    'traffic'
    traffic_flow
    'random'
    random_rule
    statis_time=0;
    car_waiting=0;
    average_car_waiting=0;
    statis_average_speed_on_road=0;
    statis_average_pass=0;
    statis_jam=0;
    statis_change=0;
    statis_bump=0;
    statis_pass=0;
    for i=1:time
    statis_all_speed=0;
    if(i==1000)
        statis_jam=0;
        statis_change=0;
        statis_bump=0;
        statis_pass=0;  
    end;
%%%%%%%%%%%%%%
    %figure(1);
    %cla;
    %hold on;
    %axis([0,1000,1,LANE_NUMBER+1]);
    tmp_size=size(cars);
    car_idx=1;
    cars(:,CAR_ROUND_END)=zeros(tmp_size(1),1);
    
    while car_idx<=tmp_size(1)
       %DrawCar(car_idx,cars(car_idx,CAR_LANE));
        if(cars(car_idx,CAR_POSITION)>1000)
            statis_pass=statis_pass+1;
            LaneRemoveCarTotally(car_idx);
            cars(car_idx,:)=[];
            tmp_size(1)=tmp_size(1)-1;
        else
            car_idx=car_idx+1;
        end
    end
    size_lanes=size(lanes);
    if(size_lanes(2)>10)
        free_lanes_memory;

    end;
    size_lanes=size(lanes);
    
    
    tmp_rand=rand();
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %0.01 0.03 0.05
    if(tmp_rand<traffic_flow)
        car_waiting=car_waiting+1;
    end;
    
    %for tmp_lane=1:LANE_NUMBER
    for tmp_lane=[2,1,3]
        if ((LanePositionEmpty(tmp_lane,10,0)==1))
            if(car_waiting>0)
                new_idx=NewCar(tmp_lane);
                LaneAddCar(tmp_lane,new_idx,0);
                car_waiting=car_waiting-1;
                break;
            end;
        end;
    end;

    for lane_idx=1:size_lanes(1)
        idx=1;
        while idx<=size_lanes(2)
            tmp_car=lanes(lane_idx,idx);
            if (tmp_car==0)
                break;
            end;

            
            if(cars(tmp_car,CAR_ROUND_END)==0) 
                CarStep(tmp_car,lane_idx,random_rule);

            end

            idx=idx+1;
        end;
    end;
    hold off;
    
    tmp_size=size(cars);    
    statis_time=statis_time+1;
    %statis_average_speed(statis_time)=statis_all_speed/(tmp_size(1)+car_waiting);
    %statis_average_jam(statis_time)=statis_jam/statis_time*10;   
    %statis_average_bump(statis_time)=statis_bump/statis_time*10;    
    %statis_average_change(statis_time)=statis_change/statis_time*10;    
    %average_car_waiting(statis_time)=car_waiting;   
    statis_average_speed(statis_time)=statis_all_speed/(tmp_size(1)+car_waiting);
    statis_average_speed_on_road(statis_time)=statis_all_speed/(tmp_size(1));
    statis_average_jam(statis_time)=statis_jam;   
    statis_average_bump(statis_time)=statis_bump;    
    statis_average_change(statis_time)=statis_change;    
    average_car_waiting(statis_time)=car_waiting;   
    statis_average_pass(statis_time)=statis_pass;      
    
    

    if(mod(statis_time,500)==0)
        %figure(2);
        subplot(1,2,1);
        plot((1:statis_time)*0.1,statis_average_speed,(1:statis_time)*0.1,statis_average_speed_on_road,(1:statis_time)*0.1,statis_average_jam,(1:statis_time)*0.1,statis_average_change);
        subplot(1,2,2);
        pause(0.001);
        plot((1:statis_time)*0.1,average_car_waiting,(1:statis_time)*0.1,statis_average_pass);
    end;
    
    end;

end


function [ decision ] = CarStep( idx_car,idx_lane,random_rule )
%UNTITLED9 Summary of this function goes here
%decision 0=go ahead
%          1=change to faster lane
%          2=change to slower lane
%          3=slow down
%          4=continue change lane
%   Detailed explanation goes here

    global CAR_POSITION;
    global CAR_LANE;
    global CAR_SPEED;
    global CAR_STANDARD_SPEED;
    global PROP_LENGTH;
    global LANE_NUMBER;
    global CAR_TYPE
    global CAR_TIME_TURNING_COUNTER;
    global CAR_TIME_TURNING;
    global CAR_STATUS;
    global CAR_ROUND_END;
    global LANE_NUMBER;
    global lanes;
    global cars

    global statis_jam;
    global statis_bump;
    global statis_change;
    global statis_all_speed;
    global statis_time;
    global statis_type;
    %%%%%%%%%%%%%%%%
    random_turn=random_rule;
    
    my_position=GetCarProperty(idx_car,CAR_POSITION);
    my_lane=GetCarProperty(idx_car,CAR_LANE);
    if(my_lane~=idx_lane)
       return;
    end
    my_status=GetCarProperty(idx_car,CAR_STATUS);
    my_speed=GetCarProperty(idx_car,CAR_SPEED);
    my_type=GetCarProperty(idx_car,CAR_TYPE);
    my_length=GetCarStyleProperty(my_type,PROP_LENGTH);
    car_ahead=GetCarAhead(idx_car);
    car_behind=GetCarBehind(idx_car);
    decision=0;

    if(abs(my_status)==1)
        decision=4;
        temp=GetCarProperty(idx_car,CAR_TIME_TURNING_COUNTER);
        cars(idx_car,CAR_TIME_TURNING_COUNTER)=temp-1;
        if(temp-1<=0)
            LaneRemoveCar(my_lane,idx_car);
            cars(idx_car,CAR_LANE)=my_lane+my_status;
            cars(idx_car,CAR_STATUS)=0;
            cars(idx_car,CAR_TIME_TURNING_COUNTER)=cars(idx_car,CAR_TIME_TURNING);
            my_speed=cars(idx_car,CAR_STANDARD_SPEED)*2;
            cars(idx_car,CAR_SPEED)=my_speed;
            statis_change=statis_change+1;
        end;
    end;
    if(decision~=4)&&(car_ahead)
        target_position=GetCarProperty(car_ahead,CAR_POSITION);
        target_type=GetCarProperty(car_ahead,CAR_TYPE);
        target_speed=GetCarProperty(car_ahead,CAR_SPEED);
        target_length=GetCarStyleProperty(target_type,PROP_LENGTH);
        if(target_position-target_length-my_position<20)
            %if(my_speed>target_speed)&&(my_lane<LANE_NUMBER)
            if(my_speed>target_speed)&&(my_lane~=2)
                if(my_lane==1)
                if(LanePositionEmpty(my_lane+1,target_position-target_length,my_position-my_length))
                    decision=1;

                    
                end;
                end;
                if(my_lane==3)
                if(LanePositionEmpty(my_lane-1,target_position-target_length,my_position-my_length))
                    decision=2;

                    
                end;
                end;
                %{
                if(random_turn==true)&&(my_lane>1)&&(decision~=1)
                    if(LanePositionEmpty(my_lane-1,target_position-target_length,my_position-my_length))
                        decision=2;
                    end;                
                end
                %}
            end;
            %{
            if(random_turn==false)&&(decision~=1)
                if(my_speed<target_speed)&&(my_lane>1)
                    if(LanePositionEmpty(my_lane-1,target_position-target_length,my_position-my_length))
                        decision=2;
                    end;
                end;
            end;
            %}
            if (decision~=1)&&(decision~=2)
                if(my_speed<target_speed)&&(my_lane~=2)
                    if(my_lane==3)
                        if(LanePositionEmpty(my_lane-1,target_position-target_length,my_position-my_length))
                            decision=2;
                        end;
                    end;
                    if(my_lane==1)
                        if(LanePositionEmpty(my_lane+1,target_position-target_length,my_position-my_length))
                            decision=1;
                        end;
                    end;
                end;
            end;
        end;

        if(my_speed>target_speed)&&(target_position-target_length-my_position<15)&&(decision~=1)&&(decision~=2)
        %if(my_speed>target_speed)&&(target_position-target_length-my_position<5)&&(decision~=1)&&(decision~=2)
            decision=3;
            my_speed=target_speed/10;
            %my_speed=target_speed;
            cars(idx_car,CAR_POSITION)=my_position+my_speed;
            cars(idx_car,CAR_SPEED)=my_speed;
            statis_jam=statis_jam+1;
        end;
    end;
    %{
    if(decision~=4)&&(car_behind)
        target_position=GetCarProperty(car_behind,CAR_POSITION);
        target_type=GetCarProperty(car_behind,CAR_TYPE);
        target_speed=GetCarProperty(car_behind,CAR_SPEED);
        target_length=GetCarStyleProperty(target_type,PROP_LENGTH);
        if(my_position-my_length-target_position<20)
            if(my_speed<target_speed)&&(my_lane>1)
                if(LanePositionEmpty(my_lane-1,my_position+20,my_position-my_length))
                    decision=2;
                    LaneAddCar(my_lane-1,idx_car,my_position);
                    cars(idx_car,CAR_TIME_TURNING_COUNTER)=cars(idx_car,CAR_TIME_TURNING);
                    cars(idx_car,CAR_STATUS)=-1;                   
                end
            end;
            %{
            if(random_turn==false)&&(decision~=1)
                if(my_speed<target_speed)&&(my_lane>1)
                    if(LanePositionEmpty(my_lane-1,target_position-target_length,my_position-my_length))
                        decision=2;
                    end;
                end;
            end;
            %}
        end;
    end;
    %}
    %{
    if(random_turn==false && decision~=4)
        if (decision~=1)&&(my_lane>1)
            if(LanePositionEmpty(my_lane-1,my_position+25,my_position-my_length))
            %if(LanePositionEmpty(my_lane-1,my_position+8,my_position-my_length))
                decision=2;
            end;
        end;
    end;
    %}
    if(decision~=4)&&(decision~=1)&&(decision~=2)
        if (my_lane==2)
            if(LanePositionEmpty(my_lane-1,my_position+25,my_position-my_length))
            %if(LanePositionEmpty(my_lane-1,my_position+8,my_position-my_length))
                decision=2;
            end;
            if(LanePositionEmpty(my_lane+1,my_position+25,my_position-my_length))
            %if(LanePositionEmpty(my_lane-1,my_position+8,my_position-my_length))
                decision=1;
            end;
        end;
    end;
    
    if(decision==2)
        LaneAddCar(my_lane-1,idx_car,my_position);
        cars(idx_car,CAR_TIME_TURNING_COUNTER)=cars(idx_car,CAR_TIME_TURNING);
        cars(idx_car,CAR_STATUS)=-1;
    end;
    if(decision==1)
        LaneAddCar(my_lane+1,idx_car,my_position);
        cars(idx_car,CAR_TIME_TURNING_COUNTER)=cars(idx_car,CAR_TIME_TURNING);
        cars(idx_car,CAR_STATUS)=1;
    end;
    
    if(decision~=3)
        cars(idx_car,CAR_POSITION)=my_position+my_speed;
    end;
    if(my_speed*3>cars(idx_car,CAR_STANDARD_SPEED))
        cars(idx_car,CAR_SPEED)=my_speed-0.2;
    end;
    if(my_speed<cars(idx_car,CAR_STANDARD_SPEED))
        cars(idx_car,CAR_SPEED)=my_speed+0.005;
    end;
    cars(idx_car,CAR_ROUND_END)=1;
    statis_all_speed=statis_all_speed+cars(idx_car,CAR_SPEED);
    return;
end


function [new_idx] = NewCar(lane)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    global CAR_SPEED;
    global CAR_STANDARD_SPEED;
    global CAR_TIME_TURNING;
    global CAR_LANE;
    global CAR_POSITION;
    global CAR_TYPE;
    global CAR_STATUS;
    global CAR_TIME_TURNING_COUNTER;
    global CAR_ROUND_END;
    global PROP_PROBABILITY;
    global PROP_LENGTH;
    global PROP_SPEED;
    global PROP_RADIUS_TURNING;
    global PROP_DANGEROUS_DISTANCE;

    global HUMANFACTOR_DISTANCE_ERROR;
    global HUMANFACTOR_SPEEDSCALE_ERROR;
    global lanes;
    global cars;
    size_temp=size(cars(:,:));
    new_idx=size_temp(1)+1;
    
    %choose a random type of car
    number_rand=rand();
    i=1;
    sum_prob=GetCarStyleProperty(1,PROP_PROBABILITY);
    while(number_rand>sum_prob)
        i=i+1;
        sum_prob=sum_prob+GetCarStyleProperty(i,PROP_PROBABILITY);
    end
    cars(new_idx,CAR_TYPE)=i;
    cars(new_idx,CAR_STANDARD_SPEED)=GetCarStyleProperty(i,PROP_SPEED)*normrnd(1,HUMANFACTOR_SPEEDSCALE_ERROR);
    %cars(new_idx,CAR_STANDARD_SPEED)=GetCarStyleProperty(i,PROP_SPEED);
    cars(new_idx,CAR_SPEED)=cars(new_idx,CAR_STANDARD_SPEED);
    
    cars(new_idx,CAR_TIME_TURNING)=CalcCarTurningTime(GetCarStyleProperty(i,PROP_RADIUS_TURNING),cars(new_idx,CAR_SPEED));
    cars(new_idx,CAR_LANE)=lane;
    cars(new_idx,CAR_POSITION)=0;
    cars(new_idx,CAR_TIME_TURNING_COUNTER)=0;
    cars(new_idx,CAR_STATUS)=0;
    cars(new_idx,CAR_ROUND_END)=0;
    
end


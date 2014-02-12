function [] = Init( lane_number_factor )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %Car_Types Global definition
    global PROP_NAME;
    PROP_NAME=1;
    global PROP_PROBABILITY;
    PROP_PROBABILITY=2;    
    global PROP_LENGTH;
    PROP_LENGTH=3;  
    global PROP_SPEED;
    PROP_SPEED=4;  
    global PROP_RADIUS_TURNING;
    PROP_RADIUS_TURNING=5;   
    global PROP_DANGEROUS_DISTANCE;
    PROP_DANGEROUS_DISTANCE=6;   
    global HUMANFACTOR_DISTANCE_ERROR;
    HUMANFACTOR_DISTANCE_ERROR=2;
    global HUMANFACTOR_SPEEDSCALE_ERROR;
    HUMANFACTOR_SPEEDSCALE_ERROR=0.2;
    global LANE_NUMBER;
    LANE_NUMBER=lane_number_factor;
%Lane Setting
    global LANE_LENGTH;
    LANE_LENGTH=1000;    %m
    global TIME_STEP;
    TIME_STEP=0.1;
    %{
    car_table=[
        1.5,0.790,4   ,3.0,0.1,6.4 ,6;
        1.5,0.164,4.8 ,3.0,0.1,9.1 ,6;
        0.9,0.036,13  ,1.8,0.1,11.6,6;
        0.8,0.010,18  ,1.6,0.1,12.5,6;
    ];
    %}
    
    %{
    car_table=[
        1.5,0.790,4   ,2.5,0.1,6.4 ,6;
        1.5,0.164,4.8 ,2.5,0.1,9.1 ,6;
        0.9,0.036,13  ,1.5,0.1,11.6,6;
        0.8,0.010,18  ,1.3,0.1,12.5,6;
    ];
    %}
    %{
    car_table=[
        1.5,0.790,4   ,3.6,0.1,6.4 ,6;
        1.5,0.164,4.8 ,3.6,0.1,9.1 ,6;
        0.9,0.036,13  ,2.1,0.1,11.6,6;
        0.8,0.010,18  ,1.9,0.1,12.5,6;
    ];
    %}
    %Real Cars Definition
    global CAR_SPEED;
    CAR_SPEED=1;    %m/s
    global CAR_STANDARD_SPEED;
    CAR_STANDARD_SPEED=2;
    global CAR_TIME_TURNING;
    CAR_TIME_TURNING=3;
    global CAR_LANE;
    CAR_LANE=4;    
    global CAR_POSITION;
    CAR_POSITION=5;  
    global CAR_TYPE;
    CAR_TYPE=6;
    global CAR_TIME_TURNING_COUNTER;
    CAR_TIME_TURNING_COUNTER=7;
    global CAR_STATUS;
    CAR_STATUS=8;
    global CAR_ROUND_END;
    CAR_ROUND_END=9;
    global cars;
    cars=[];
    global lanes;
    lanes=zeros(LANE_NUMBER,1);
    
    global statis_jam;
    statis_jam=[];
    global statis_bump;
    statis_bump=[];
    global statis_change;
    statis_change=[];
    global statis_average_speed;
    statis_average_speed=[];
    global statis_type;
    statis_type=[];
    global statis_average_jam;
    statis_average_jam=[];
    global statis_average_bump;
    statis_average_bump=[];
    global statis_average_change;
    statis_average_change=[];
    global statis_average_speed;  
    statis_average_speed=[];
    global statis_average_speed_on_road;  
    statis_average_speed_on_road=[];
end


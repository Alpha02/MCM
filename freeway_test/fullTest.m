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
test_time=11000;
statis_all=0;
global car_table;
for ii=1:4

if(ii==1)
car_table=[
    1.5,0.790,4   ,3.0,0.1,6.4 ,6;
    1.5,0.164,4.8 ,3.0,0.1,9.1 ,6;
    0.9,0.036,13  ,1.8,0.1,11.6,6;
    0.8,0.010,18  ,1.6,0.1,12.5,6;
]
Init(3);

SystemRefresh(test_time,0.015,1)
wtf_speed_all_1=statis_average_speed(1001:test_time);
wtf_speed2_all_1=statis_average_speed_on_road(1001:test_time);
statis_all(1,2)=statis_average_jam(test_time);
statis_all(1,3)=statis_average_change(test_time);
statis_all(1,4)=statis_average_pass(test_time);
statis_all(1,5)=average_car_waiting(test_time);
Init(3);
SystemRefresh(test_time,0.015,0)
wtf_speed_all_2=statis_average_speed(1001:test_time);
wtf_speed2_all_2=statis_average_speed_on_road(1001:test_time);
statis_all(2,2)=statis_average_jam(test_time);
statis_all(2,3)=statis_average_change(test_time);
statis_all(2,4)=statis_average_pass(test_time);
statis_all(2,5)=average_car_waiting(test_time);
Init(3);


SystemRefresh(test_time,0.045,1)
statis_all(3,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(3,2)=statis_average_jam(test_time);
statis_all(3,3)=statis_average_change(test_time);
statis_all(3,4)=statis_average_pass(test_time);
statis_all(3,5)=average_car_waiting(test_time);
Init(3);
SystemRefresh(test_time,0.045,0)
statis_all(4,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(4,2)=statis_average_jam(test_time);
statis_all(4,3)=statis_average_change(test_time);
statis_all(4,4)=statis_average_pass(test_time);
statis_all(4,5)=average_car_waiting(test_time);


Init(3);
SystemRefresh(test_time,0.075,1)
statis_all(5,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(5,2)=statis_average_jam(test_time);
statis_all(5,3)=statis_average_change(test_time);
statis_all(5,4)=statis_average_pass(test_time);
statis_all(5,5)=average_car_waiting(test_time);
Init(3);

SystemRefresh(test_time,0.075,0)
statis_all(6,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(6,2)=statis_average_jam(test_time);
statis_all(6,3)=statis_average_change(test_time);
statis_all(6,4)=statis_average_pass(test_time);
statis_all(6,5)=average_car_waiting(test_time);

end;
if(ii==2)
car_table=[
    1.5,0.790,4   ,3.0,0.1,6.4 ,6;
    1.5,0.164,4.8 ,3.0,0.1,9.1 ,6;
    0.9,0.036,13  ,1.8,0.1,11.6,6;
    0.8,0.010,18  ,1.6,0.1,12.5,6;
]
Init(2);

SystemRefresh(test_time,0.01,1)
wtf_speed_all_3=statis_average_speed(1001:test_time);
wtf_speed2_all_3=statis_average_speed_on_road(1001:test_time);
statis_all(7,2)=statis_average_jam(test_time);
statis_all(7,3)=statis_average_change(test_time);
statis_all(7,4)=statis_average_pass(test_time);
statis_all(7,5)=average_car_waiting(test_time);
Init(2);
SystemRefresh(test_time,0.01,0)
wtf_speed_all_4=statis_average_speed(1001:test_time);
wtf_speed2_all_4=statis_average_speed_on_road(1001:test_time);
statis_all(8,2)=statis_average_jam(test_time);
statis_all(8,3)=statis_average_change(test_time);
statis_all(8,4)=statis_average_pass(test_time);
statis_all(8,5)=average_car_waiting(test_time);
Init(2);


SystemRefresh(test_time,0.03,1)
statis_all(9,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(9,2)=statis_average_jam(test_time);
statis_all(9,3)=statis_average_change(test_time);
statis_all(9,4)=statis_average_pass(test_time);
statis_all(9,5)=average_car_waiting(test_time);
statis_all(9,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
Init(2);
SystemRefresh(test_time,0.03,0)
statis_all(10,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(10,2)=statis_average_jam(test_time);
statis_all(10,3)=statis_average_change(test_time);
statis_all(10,4)=statis_average_pass(test_time);
statis_all(10,5)=average_car_waiting(test_time);
statis_all(10,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);

Init(2);
SystemRefresh(test_time,0.05,1)
statis_all(11,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(11,2)=statis_average_jam(test_time);
statis_all(11,3)=statis_average_change(test_time);
statis_all(11,4)=statis_average_pass(test_time);
statis_all(11,5)=average_car_waiting(test_time);
statis_all(11,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
Init(2);

SystemRefresh(test_time,0.05,0)
statis_all(12,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(12,2)=statis_average_jam(test_time);
statis_all(12,3)=statis_average_change(test_time);
statis_all(12,4)=statis_average_pass(test_time);
statis_all(12,5)=average_car_waiting(test_time);
statis_all(12,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
end;
if(ii==3)



    car_table=[
        1.5,0.790,4   ,2.5,0.1,6.4 ,6;
        1.5,0.164,4.8 ,2.5,0.1,9.1 ,6;
        0.9,0.036,13  ,1.5,0.1,11.6,6;
        0.8,0.010,18  ,1.3,0.1,12.5,6;
    ]
Init(2);

SystemRefresh(test_time,0.01,1);
wtf_speed_all_5=statis_average_speed(1001:test_time);
wtf_speed2_all_5=statis_average_speed_on_road(1001:test_time);
statis_all(13,2)=statis_average_jam(test_time);
statis_all(13,3)=statis_average_change(test_time);
statis_all(13,4)=statis_average_pass(test_time);
statis_all(13,5)=average_car_waiting(test_time);
Init(2);
SystemRefresh(test_time,0.01,0);
wtf_speed_all_6=statis_average_speed(1001:test_time);
wtf_speed2_all_6=statis_average_speed_on_road(1001:test_time);
statis_all(14,2)=statis_average_jam(test_time);
statis_all(14,3)=statis_average_change(test_time);
statis_all(14,4)=statis_average_pass(test_time);
statis_all(14,5)=average_car_waiting(test_time);
Init(2);


SystemRefresh(test_time,0.03,1);
statis_all(15,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(15,2)=statis_average_jam(test_time);
statis_all(15,3)=statis_average_change(test_time);
statis_all(15,4)=statis_average_pass(test_time);
statis_all(15,5)=average_car_waiting(test_time);
statis_all(15,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
Init(2);
SystemRefresh(test_time,0.03,0);
statis_all(16,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(16,2)=statis_average_jam(test_time);
statis_all(16,3)=statis_average_change(test_time);
statis_all(16,4)=statis_average_pass(test_time);
statis_all(16,5)=average_car_waiting(test_time);
statis_all(16,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);


Init(2);
SystemRefresh(test_time,0.05,1);
statis_all(17,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(17,2)=statis_average_jam(test_time);
statis_all(17,3)=statis_average_change(test_time);
statis_all(17,4)=statis_average_pass(test_time);
statis_all(17,5)=average_car_waiting(test_time);
statis_all(17,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
Init(2);

SystemRefresh(test_time,0.05,0);
statis_all(18,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(18,2)=statis_average_jam(test_time);
statis_all(18,3)=statis_average_change(test_time);
statis_all(18,4)=statis_average_pass(test_time);
statis_all(18,5)=average_car_waiting(test_time);
statis_all(18,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
end;
if(ii==4)

car_table=[
    1.5,0.790,4   ,3.6,0.1,6.4 ,6;
    1.5,0.164,4.8 ,3.6,0.1,9.1 ,6;
    0.9,0.036,13  ,2.1,0.1,11.6,6;
    0.8,0.010,18  ,1.9,0.1,12.5,6;
]
Init(2);

SystemRefresh(test_time,0.01,1)
wtf_speed_all_7=statis_average_speed(1001:test_time);
wtf_speed2_all_7=statis_average_speed_on_road(1001:test_time);
statis_all(19,2)=statis_average_jam(test_time);
statis_all(19,3)=statis_average_change(test_time);
statis_all(19,4)=statis_average_pass(test_time);
statis_all(19,5)=average_car_waiting(test_time);
Init(2);
SystemRefresh(test_time,0.01,0)
wtf_speed_all_8=statis_average_speed(1001:test_time);
wtf_speed2_all_8=statis_average_speed_on_road(1001:test_time);
statis_all(20,2)=statis_average_jam(test_time);
statis_all(20,3)=statis_average_change(test_time);
statis_all(20,4)=statis_average_pass(test_time);
statis_all(20,5)=average_car_waiting(test_time);
Init(2);


SystemRefresh(test_time,0.03,1)
statis_all(21,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(21,2)=statis_average_jam(test_time);
statis_all(21,3)=statis_average_change(test_time);
statis_all(21,4)=statis_average_pass(test_time);
statis_all(21,5)=average_car_waiting(test_time);
statis_all(21,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
Init(2);
SystemRefresh(test_time,0.03,0)
statis_all(22,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(22,2)=statis_average_jam(test_time);
statis_all(22,3)=statis_average_change(test_time);
statis_all(22,4)=statis_average_pass(test_time);
statis_all(22,5)=average_car_waiting(test_time);
statis_all(22,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);


Init(2);
SystemRefresh(test_time,0.05,1)
statis_all(23,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(23,2)=statis_average_jam(test_time);
statis_all(23,3)=statis_average_change(test_time);
statis_all(23,4)=statis_average_pass(test_time);
statis_all(23,5)=average_car_waiting(test_time);
statis_all(23,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
Init(2);

SystemRefresh(test_time,0.05,0)
statis_all(24,1)= sum(statis_average_speed(1001:test_time))/(test_time-1000);
statis_all(24,2)=statis_average_jam(test_time);
statis_all(24,3)=statis_average_change(test_time);
statis_all(24,4)=statis_average_pass(test_time);
statis_all(24,5)=average_car_waiting(test_time);
statis_all(24,6)= sum(statis_average_speed_on_road(1001:test_time))/(test_time-1000);
end;
end;
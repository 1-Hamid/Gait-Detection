function [time,time2,ts,shots,gyro_x,gyro_y,gyro_z,acc_x,acc_y,acc_z,acc_sag,label] = extractDatas(datas)
    
    time = datas.time;
    time2 = datas.time2';
    ts = datas.ts';
    shots = datas.shots;
    
    acc_x = datas.acc_x;
    acc_y = datas.acc_y;
    acc_z = datas.acc_z;
    acc_sag = datas.acc_sag;
    
    gyro_x = datas.gyro_x;
    gyro_y = datas.gyro_y;
    gyro_z = datas.gyro_z; 
    
     label = datas.label;
end
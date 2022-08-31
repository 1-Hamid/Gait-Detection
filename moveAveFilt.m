function filteredDatas = moveAveFilt(datas,timeStep)

    [time,time2,ts,shots,gyro_x,gyro_y,gyro_z,acc_x,acc_y,acc_z,acc_sag,label] = extractDatas(datas);
    
    % Create a moving average filter
    num = 1/timeStep*ones(timeStep,1);
    denum = 1;
    
    gyro_x_filtered = filter(num,denum,gyro_x);
    gyro_y_filtered = filter(num,denum,gyro_y);
    gyro_z_filtered = filter(num,denum,gyro_z);
    
    acc_x_filtered = filter(num,denum,acc_x);
    acc_y_filtered = filter(num,denum,acc_y);
    acc_z_filtered = filter(num,denum,acc_z);
    acc_sag_filtered = filter(num,denum,acc_sag);
    
    filteredDatas.time = time;
    filteredDatas.time2 = time2;
    filteredDatas.ts = ts;
    filteredDatas.shots = shots;
    
    filteredDatas.gyro_x = gyro_x_filtered;
    filteredDatas.gyro_y = gyro_y_filtered;
    filteredDatas.gyro_z = gyro_z_filtered;
    
    filteredDatas.acc_x = acc_x_filtered;
    filteredDatas.acc_y = acc_y_filtered;
    filteredDatas.acc_z = acc_z_filtered;
    filteredDatas.acc_sag = acc_sag_filtered;
    
    filteredDatas.label = label;

end
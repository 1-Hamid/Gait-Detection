function D = normalizeDatas(datas)

    [time,time2,ts,shots,gyro_x,gyro_y,gyro_z,acc_x,acc_y,acc_z,acc_sag,label] = extractDatas(datas);
    
    gyro_x = (gyro_x - mean(gyro_x))/(max(gyro_x)-min(gyro_x));
    gyro_y = (gyro_y - mean(gyro_y))/(max(gyro_y)-min(gyro_y));
    gyro_z = (gyro_z - mean(gyro_z))/(max(gyro_z)-min(gyro_z));
    
    acc_x = (acc_x - mean(acc_x))/(max(acc_x)-min(acc_x));
    acc_y = (acc_y - mean(acc_y))/(max(acc_y)-min(acc_y));
    acc_z = (acc_z - mean(acc_z))/(max(acc_z)-min(acc_z));
    acc_sag = (acc_sag - mean(acc_sag))/(max(acc_sag)-min(acc_sag));
    
    D.time = time;
    D.time2 = time2;
    D.ts = ts;
    D.shots = shots;
    
    D.gyro_x = gyro_x;
    D.gyro_y = gyro_y;
    D.gyro_z = gyro_z;
    
    D.acc_x = acc_x;
    D.acc_y = acc_y;
    D.acc_z = acc_z;
    D.acc_sag = acc_sag;
    
    D.label = label;
    
end
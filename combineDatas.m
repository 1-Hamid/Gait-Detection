function datas = combineDatas(datas1,datas2,datas3)

    datas.gyro_x = [datas1.gyro_x ; datas2.gyro_x; datas3.gyro_x];
    datas.gyro_y = [datas1.gyro_y ; datas2.gyro_y; datas3.gyro_y];
    datas.gyro_z = [datas1.gyro_z ; datas2.gyro_z; datas3.gyro_z];
    
    datas.acc_x = [datas1.acc_x ; datas2.acc_x; datas3.acc_x];
    datas.acc_y = [datas1.acc_y ; datas2.acc_y; datas3.acc_y];
    datas.acc_z = [datas1.acc_z ; datas2.acc_z; datas3.acc_z];
    datas.acc_sag = [datas1.acc_sag ; datas2.acc_sag; datas3.acc_sag];
    
    datas.label = [datas1.label ; datas2.label; datas3.label];
    
    
%     datas.gyro_x = [datas1.gyro_x ; datas2.gyro_x];
%     datas.gyro_y = [datas1.gyro_y ; datas2.gyro_y];
%     datas.gyro_z = [datas1.gyro_z ; datas2.gyro_z];
%     
%     datas.acc_x = [datas1.acc_x ; datas2.acc_x];
%     datas.acc_y = [datas1.acc_y ; datas2.acc_y];
%     datas.acc_z = [datas1.acc_z ; datas2.acc_z];
%     datas.acc_sag = [datas1.acc_sag ; datas2.acc_sag];
%     
%     datas.label = [datas1.label ; datas2.label];
    
end
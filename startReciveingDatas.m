function datas = startReciveingDatas()
    %% initialization
    if ~isempty(instrfind)
        fclose(instrfind);
        delete(instrfind);
    end
    
    endpoint = 500;

    shots = cell(endpoint,1);
    time2 = zeros(endpoint,1);

    time = zeros(endpoint,1);
    acc_x = zeros(endpoint,1);
    acc_y = zeros(endpoint,1);
    acc_z = zeros(endpoint,1);
    gyro_x = zeros(endpoint,1);
    gyro_y = zeros(endpoint,1);
    gyro_z = zeros(endpoint,1);
    acc_sag = zeros(endpoint,1);

    %% set up camera
    cam = ipcam('http://192.168.1.6:8080/video');
    [shots{1},ts(1)] = snapshot(cam);

    %% set up sensors
    phoneIP = '192.168.1.3';
    port = 5555;

    u = udp(phoneIP, port - 1 , 'LocalPort' , port , 'InputBufferSize' , 8192);
    fopen(u);
     tic;

    %% data gathering and classifying
    for i=1:endpoint
        
        if rem(i,3) == 0
            time2(i) = toc;
            [shots{i},ts(i)] = snapshot(cam);  % At this point, shot is taken
        end

        [msg,~] = fread(u,15);                 % At this point, datas are achieved
        
        msgCell = strsplit(char(msg)',',');
        if i == 1
            st = str2double(msgCell{1});
        end

        if size(msgCell,2) >= 9
            time(i) = str2double(msgCell{1})-st;
            acc_x(i) = str2double(msgCell{3});
            acc_y(i) = str2double(msgCell{4});
            acc_z(i) = str2double(msgCell{5});
            gyro_x(i) = str2double(msgCell{7});
            gyro_y(i) = str2double(msgCell{8});
            gyro_z(i) = str2double(msgCell{9});
        else
            time(i) = str2double(msgCell{1})-st;
            acc_x(i) = acc_x(i-1);
            acc_y(i) = acc_y(i-1);
            acc_z(i) = acc_z(i-1);
            gyro_x(i) = gyro_x(i-1);
            gyro_y(i) = gyro_y(i-1);
            gyro_z(i) = gyro_z(i-1);
        end
        acc_sag(i) = sqrt(acc_x(i)^2+acc_z(i)^2);
    end
    
    %% save resualts
    datas.acc_x = acc_x;
    datas.acc_y = acc_y;
    datas.acc_z = acc_z;
    datas.acc_sag = acc_sag;
    
    datas.gyro_x = gyro_x;
    datas.gyro_y = gyro_y;
    datas.gyro_z = gyro_z;
    
    datas.shots = shots;
    datas.time = time;
    datas.time2 = time2;
    datas.ts = ts;
end

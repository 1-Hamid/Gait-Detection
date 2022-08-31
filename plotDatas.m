function plotDatas(datas)
    %% extracting necessary datas
%     [time,~,~,~,gyro_x,gyro_y,gyro_z,acc_x,acc_y,acc_z,acc_sag] = extractDatas(datas);
    time = datas.time;
    gyro_y = datas.gyro_y;
    acc_sag = datas.acc_sag;
    
    %% plot resualts
    subplot(1,2,1);
    plot(time,gyro_y,'b');
    xlabel('Time(s)');
    ylabel('Angular Velocity_y(rad/s)')
    grid on;

    subplot(1,2,2);
    plot(time,acc_sag,'r');
    xlabel('Time(s)');
    ylabel('Linear Accelaration(m/s^2)');
    grid on;

end

%%
% for i=3:3:endpoint
%     figure(1);
%     imshow(datas.shots{i});
% end


figure(100);
plot(1:500,datas.gyro_y);
hold on;
 thetadd_y = diff(datas.gyro_y);
 plot(1:499,thetadd_y,'r');
% hold on;
% plot(1:1500,datas.acc_sag,'g');
% hold on;
plot(1:500,datas.label,'k');
hold on;
grid on;
xlabel('Data Sample Number');
ax=gca;
ax.FontSize=16;
ylabel('Raw Values');
legend('Angular Velocity_y','Angular Acceleration_y','Real Phases of Walking');
% ylabel('Angular Velocity(Filtered and Normalized)');
plot(1:500,n.z/25,'k--');
grid on;
% legend('Angular Velocity_y','Real Phases of Walking',...
%     'Detected Phases of Walking using Machine Learning Algorithm');
legend('Angular Velocity_y','Real Phases of Walking',...
    'Detected Phases of Walking using Optimized Threshold Based Algorithm');

% legend('Angular Velocity_y','Angular Acceleration_y','Total Accelaraton','Real Phases of Walking',...
%     'Detected Phases of Walking using Optimized Threshold Based Algorithm');
% 
% 
figure(200);
plot((1:500)*0.02,datas.gyro_y);
hold on;
% thetadd_y = diff(datas.gyro_y);
% plot(datas.time,datas.thetadd_y,'r');
% hold on;
% plot(datas.time,datas.acc_sag,'g');
% hold on;
plot((1:500)*0.02,datas.label/25,'k');
hold on;
grid on;
ax=gca;
ax.FontSize=16;
xlabel('Time(s)');
ylabel('Magnitude of normalized datas');
plot((1:500)*0.02,n.z/25,'k--');
grid on;
legend('Angular Velocity_y','Real Phases of Walking',...
    'Detected Phases of Walking using Optimized Threshold Based Algorithm');
% legend('Angular Velocity_y','Angular Acceleration_y','Total Accelaraton','Real Phases of Walking',...
%     'Detected Phases of Walking using Optimized Threshold Based Algorithm');
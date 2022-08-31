function sol = ruleBasedSolution(datas,params)
    %% extracting datas and initializing
%     [~,~,~,~,gyro_x,gyro_y,gyro_z,acc_x,acc_y,acc_z,acc_sag,~] = extractDatas(datas);

    gyro_x = datas.gyro_x;
    gyro_y = datas.gyro_y;
    gyro_z = datas.gyro_z;
    acc_sag = datas.acc_sag;
    
    endpoint = size(gyro_y,1);
    
    z = zeros(endpoint,1);  % z=1 => MSt; z=2 => TSt; z=3 => Sw; z=4 => LR
    z(1) = 1;
    HO = zeros(endpoint,1);
    TO = zeros(endpoint,1);
    HS = zeros(endpoint,1);
    TS = zeros(endpoint,1);
    
    gyro_r = sqrt(gyro_x.^2 + gyro_y.^2 + gyro_z.^2);
    
    thetadd_y = diff(gyro_y);
    thetadd_y(endpoint) = thetadd_y(endpoint-1);
    
    %% set parameters
%          gyro_y_HO = params(1);
%          gyro_y_TO = params(2);
%          gyro_y_HS = params(3);
%         gyro_r_TS = params(4);
%         thetadd_y_HO = params(5);
%         acc_x_HS = params(6);
        
    %% Algorithm 2
%     for i = 1:endpoint
%         if i > 1
%             switch z(i-1)
%                 
%                 case 1
%                     z(i) = 1;
%                     if i > 3
%                         count = 0;
%                         for j = 0:1:3
%                             if abs(gyro_y(i-j)) >= params(1) 
%                                 count = count+1;
%                             end
%                         end
%                         if count == 4
%                             z(i) = 2;
%                         end
%                     end
%                     
%                 case 2
%                     z(i) = 2;
%                     if (abs(thetadd_y(i)-acc_sag(i)) < params(2)) && (abs(thetadd_y(i) < params(3)))
%                         z(i) = 3;
%                     end
% %                     if (abs(thetadd_y(i-1)) < params(2)) && (gyro_y(i-1) < params(3))
% %                         z(i) = 3;
% %                     end
%                         
%                 case 3
%                     z(i) = 3;
%                     if gyro_y(i-1) < 0 && gyro_y(i) > 0
%                         z(i) = 4;
%                     end
% %                     if abs(gyro_y(i)-thetadd_y(i)) < params(4)
% %                         z(i) = 4;
% %                     end
%                     
% %                     if i > 5 && i < endpoint
% %                         count = 0;
% %                         for j = 0:1:2
% %                             if abs(gyro_y(i-j)-thetadd_y(i-j)) < 0.05
% %                                 count = count+1;
% %                             end
% %                         end
% %                         if count == 3
% %                             z(i) = 4;
% %                         end
% %                     end
%                     
%                 case 4
%                     z(i) = 4;
%                     if i > 7
%                         count = 0;
%                         for j = 0:1:7
%                             if (abs(gyro_y(i-j)) < params(4) && abs(thetadd_y(i-j) < params(5)))
%                                 count = count+1;
%                             end
%                         end
%                         if count == 8
%                             z(i) = 1;
%                         end
%                     end
%             end
%         end
%     end
%     
%     sol.z = z;
%     sol.HO = HO;
%     sol.TO = TO;
%     sol.HS = HS;
%     sol.TS = TS;
% end



%% Algorithm 3
    for i = 1:endpoint
        if i > 1
            switch z(i-1)
                
                case 1
                    z(i) = 1;
                    if i > 3
                        count = 0;
                        for j = 0:1:3
                            if abs(gyro_y(i-j)) >= params(1)
                                count = count+1;
                            end
                        end
                        if count == 4
                            z(i) = 2;
                        end
                    end
                    
                case 2
                    z(i) = 2;
                    if gyro_y(i-1) > params(2) && gyro_y(i) < params(3)
                        z(i) = 3;
                    end
                        
                case 3
                    z(i) = 3;
                    if gyro_y(i-1) < params(4) && gyro_y(i) > params(5)
                        z(i) = 4;
                    end
                    
                case 4
                    z(i) = 4;
                    if i > 3
                        count = 0;
                        for j = 0:1:3
                            if abs(gyro_y(i-j)) < params(6) && abs(thetadd_y(i-j) < params(7))
                                count = count+1;
                            end
                        end
                        if count == 4
                            z(i) = 1;
                        end
                    end

            end
        end
    end
    
    sol.z = z;
    sol.HO = HO;
    sol.TO = TO;
    sol.HS = HS;
    sol.TS = TS;
end





 %% Algorithm 1
%     for i = 1:endpoint
%         if i > 1
%             switch z(i-1)
%                 
%                 case 1
%                     z(i) = 1;
%                     if i > 3
%                         count = 0;
%                         for j = 0:1:3
%                             if abs(gyro_y(i-j)) >= params(1)
%                                 count = count+1;
%                             end
%                         end
%                         if count == 4
%                             z(i) = 2;
%                         end
%                     end
%                     
%                 case 2
%                     z(i) = 2;
%                     if gyro_y(i-1) > params(2) && gyro_y(i) < params(3)
%                         z(i) = 3;
%                     end
%                         
%                 case 3
%                     z(i) = 3;
%                     if gyro_y(i-1) < params(4) && gyro_y(i) > params(5)
%                         z(i) = 4;
%                     end
%                     if i > 5 && i < endpoint
%                         count = 0;
%                         for j = 0:1:2
%                             if abs(gyro_y(i-j)-thetadd_y(i-j)) < 0.05
%                                 count = count+1;
%                             end
%                         end
%                         if count == 3
%                             z(i) = 4;
%                         end
%                     end
%                     
%                 case 4
%                     z(i) = 4;
%                     if i > 3
%                         count = 0;
%                         for j = 0:1:3
%                             if abs(gyro_y(i-j)) < params(6) && abs(thetadd_y(i-j) < params(7))
%                                 count = count+1;
%                             end
%                         end
%                         if count == 4
%                             z(i) = 1;
%                         end
%                     end
%                     if i > 7
%                         count = 0;
%                         for j = 0:1:7
%                             if abs(gyro_y(i-j)) < params(5)
%                                 count = count+1;
%                             end
%                         end
%                         if count == 8
%                             z(i) = 1;
%                         end
%                     end
%             end
%         end
%     end
%     
%     sol.z = z;
%     sol.HO = HO;
%     sol.TO = TO;
%     sol.HS = HS;
%     sol.TS = TS;
% end
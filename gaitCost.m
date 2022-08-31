function c=gaitCost(datas,sol)

    global NFE;
    if isempty(NFE)
        NFE=0;
    end

    NFE=NFE+1;
    
    label = datas.label;
    endpoint = numel(label);
    gaitPhasesDetected = sol.z;
    
    a = label-gaitPhasesDetected;
    c=0;
    for i=1:endpoint
        if a(i)~=0
            c=c+1;
        end
    end
    
%     confusionMatrix = zeros(4,4);
%     
%     for i = 1:numel(label)
%         switch label(i)
%             case 1
%                 if gaitPhasesDetected(i) == 1
%                     confusionMatrix(1,1) = confusionMatrix(1,1) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(2,1) = confusionMatrix(2,1) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 3
%                     confusionMatrix(3,1) = confusionMatrix(3,1) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(4,1) = confusionMatrix(4,1) + 1;
%                 end
%                 
%             case 2
%                  if gaitPhasesDetected(i) == 1
%                     confusionMatrix(1,2) = confusionMatrix(1,2) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(2,2) = confusionMatrix(2,2) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 3
%                     confusionMatrix(3,2) = confusionMatrix(3,2) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(4,2) = confusionMatrix(4,2) + 1;
%                 end
%                 
%             case 3
%                  if gaitPhasesDetected(i) == 1
%                     confusionMatrix(1,3) = confusionMatrix(1,3) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(2,3) = confusionMatrix(2,3) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 3
%                     confusionMatrix(3,3) = confusionMatrix(3,3) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(4,3) = confusionMatrix(4,3) + 1;
%                 end
%                 
%             case 4
%                 if gaitPhasesDetected(i) == 1
%                     confusionMatrix(1,4) = confusionMatrix(1,4) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(2,4) = confusionMatrix(2,4) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 3
%                     confusionMatrix(3,4) = confusionMatrix(3,4) + 1;
%                 end
%                 if gaitPhasesDetected(i) == 2
%                     confusionMatrix(4,4) = confusionMatrix(4,4) + 1;
%                 end
%         end
%     end
%     
%     P = zeros(1,4)+0.01;
%    
%     temp = confusionMatrix(1,1)/sum(confusionMatrix(1,1:4));
%     if isnan(temp) == 0 && temp ~= 0
%         P(1) = temp;
%     end
%     temp = confusionMatrix(2,2)/sum(confusionMatrix(2,1:4));
%     if isnan(temp) == 0 && temp ~= 0
%         P(2) = temp;
%     end
%     temp = confusionMatrix(3,3)/sum(confusionMatrix(3,1:4));
%     if isnan(temp) == 0 && temp ~= 0
%         P(3) = temp;
%     end
%     temp = confusionMatrix(4,4)/sum(confusionMatrix(4,1:4));
%     if isnan(temp) == 0 && temp ~= 0
%         P(4) = temp;
%     end
%     
%     R = zeros(1,4)+0.01; 
%     
%     temp = confusionMatrix(1,1)/sum(confusionMatrix(1:4,1));
%     if isnan(temp) == 0 && temp ~= 0
%         R(1) = temp;
%     end
%     temp = confusionMatrix(2,2)/sum(confusionMatrix(1:4,2));
%     if isnan(temp) == 0 && temp ~= 0
%         R(2) = temp;
%     end
%     temp = confusionMatrix(3,3)/sum(confusionMatrix(1:4,3));
%     if isnan(temp) == 0 && temp ~= 0
%         R(3) = temp;
%     end
%     temp = confusionMatrix(4,4)/sum(confusionMatrix(1:4,4));
%     if isnan(temp) == 0 && temp ~= 0
%         R(4) = temp;
%     end
%     
%     
%     F1_score_1 = 2*P(1)*R(1)/(P(1)+R(1));
%     F1_score_2 = 2*P(2)*R(2)/(P(2)+R(2));
%     F1_score_3 = 2*P(3)*R(3)/(P(3)+R(3));
%     F1_score_4 = 2*P(4)*R(4)/(P(4)+R(4));
%     
%     F1_score = (F1_score_1 + F1_score_2 + F1_score_3 + F1_score_4) / 4; % 0 < F1_score < 1
%     
%     c = 1 - F1_score; % we want to maximize F1_score or minimizing 1 - F1_score
    
end
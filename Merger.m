import java.awt.Robot;
import java.awt.event.*;

%%Key Mappings
% [ xmin  xmax ]
% [ ymin  ymax ]
% 
clear;
%xS=[8.0 10.7 13.5 16.6 19.5 22.5 25.5 28 31];
%yS=[7.5 10.5 13.5 17 20.0 23.5 26.5 29.5 33.5];

xS=[6.0 9.8 13.1 16.2 19.4 22.6 25.9 29 33.0];
yS=[6.0 9.8 13.2 16.4 19.8 23 26.2 29.6 33.5];



screenMapX=[1111 1195 1273 1352 1440 1552 1600 1684];
screenMapY=[865 790 715 635 570 500 420 350];



xS=[8.0 10.7 13.5 16.6 19.5 22.5 25.5 28 31];
yS=[7.5 10.5 13.5 17 20.0 23.5 26.5 29.5 33.5];



 
% mouse position declaration completed.

robot = Robot();

dir_content = dir;
filenames = {dir_content.name};
current_files = filenames;
while true
  dir_content = dir;
  filenames = {dir_content.name};

  new_files = setdiff(filenames,current_files);
  if ~isempty(new_files)
    % deal with the new files
    %current_files = filenames;
    try 
    [data1,fs]=audioread('BL.wav');
    [data2,fs]=audioread('BR.wav');
    [data3,fs]=audioread('TL.wav');
    [data4,fs]=audioread('TR.wav');
    
    
    merged(1,:) = transpose(data1);
    merged(2,:) = transpose(data2);
    merged(3,:) = transpose(data3);
    merged(4,:) = transpose(data4);
     
    result = func_touch_localization(merged);
    disp(result);

    x=result(1,1);
    y=result(1,2);
    
    
    i=1;
    while i <= length(xS)
        if x < xS(i)
            break;
        end
        i=i+1;
    end

    gridX = i-1;

    i=1;
    while i <= length(yS)
        if y < yS(i)
            break;
        end
        i=i+1;
    end

    gridY=i-1;
    display([gridX gridY]);

    robot.mouseMove(screenMapX(gridX), screenMapY(gridY));
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.mouseRelease(InputEvent.BUTTON1_MASK);
    
    
    
    catch e
          %disp(e);
    end
    
    pl1=plot(subplot(2,2,1),data1);
    pl2=plot(subplot(2,2,2),data2);
    pl3=plot(subplot(2,2,3),data3);
    pl4=plot(subplot(2,2,4),data4);

    pause(0.001);
    
  else
   
  end
end
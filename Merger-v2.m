import java.awt.Robot;
import java.awt.event.*;

%%Key Mappings
% [ xmin  xmax ]
% [ ymin  ymax ]
% 
clear;

%Physical dimensions.
%
%(g,h)               (e,f)
%
%
%
%
%
%(a,b)               (c,d)

a=10;
b=1;

c=40;
d=1;

e=40;
f=25;

g=10;
h=25;

%screen dimensions.
%
%(g',h')               (e',f')
%
%
%
%
%
%(a',b')               (c',d')
aP=418;
bP=964;

cP=1518;
dP=964;

eP=1518;
fP=99;

gP=418;
hP=99;

 
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

    gridX = aP + ((x-a)*( (cP-aP)/(c-a)  ));
    gridY = bP - ((y-b)*( (hP-bP)/(h-b)  ));
    
    
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
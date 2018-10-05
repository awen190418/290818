import java.awt.Robot;
import java.awt.event.*;

%%Key Mappings
% [ xmin  xmax ]
% [ ymin  ymax ]
%

%Button1 = [370 430; 320 385];
%Button2 = [430 500; 320 385]
%Button3 = [500 570; 320 385]

%Button4 = [370 430; 385 455]
%Button5 = [430 500; 385 455]
%Button6 = [500 570; 385 455]

%Button7 = [370 430; 455 522]
%Button8 = [430 500; 455 522]
%Button9 = [500 570; 455 522]

%Restart = [370 430; 320 385]

b1 = [400 355];
b2 = [475 350];
b3 = [535 350];

b4 = [400 420];
b5 = [475 420];
b6 = [535 420];

b7 = [400 492];
b8 = [475 492];
b9 = [535 492];

restart = [ 470 560]; 
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
    
    
    if (x > 9 && x < 12) && ( y > 12 && y < 15)
        disp(7)
        robot.mouseMove(b7(1,1), b7(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
    end
    if (x > 12 && x < 15) && ( y > 12 && y < 15) 
        disp(8)
        robot.mouseMove(b8(1,1), b8(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
        
    end
    if (x > 15 && x < 18) && ( y > 12 && y < 15) 
        disp(9)
        robot.mouseMove(b9(1,1), b9(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
        
    end
    
    if (x > 9 && x < 12) && ( y > 15 && y < 18)
        disp(4)
        robot.mouseMove(b4(1,1), b4(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
    end
    if (x > 12 && x < 15) && ( y > 15 && y < 18) 
        disp(5)
        robot.mouseMove(b5(1,1), b5(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
    end
    if (x > 15 && x < 18) && ( y > 15 && y < 18) 
        disp(6)
        robot.mouseMove(b6(1,1), b6(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
        
    end
    
    if (x > 9 && x < 12) && ( y > 18 && y < 21)
        disp(1)
        robot.mouseMove(b1(1,1), b1(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);

    end
    if (x > 12 && x < 15) && ( y > 18 && y < 21) 
        disp(2)
        robot.mouseMove(b2(1,1), b2(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
        
    end
    if (x > 15 && x < 18) && ( y > 18 && y < 21) 
        disp(3)
        robot.mouseMove(b3(1,1), b3(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
    end
    
    
    if (x > 12 && x < 18 ) && ( y > 6 && y < 9) 
        disp("Restart")
        robot.mouseMove(restart(1,1), restart(1,2));
        robot.mousePress(InputEvent.BUTTON1_MASK);
        robot.mouseRelease(InputEvent.BUTTON1_MASK);
        
    end
    
    
         
    
    
    
    
    
    
    
    catch e
          e;
    end
    
    pl1=plot(subplot(2,2,1),data1);
    pl2=plot(subplot(2,2,2),data2);
    pl3=plot(subplot(2,2,3),data3);
    pl4=plot(subplot(2,2,4),data4);

    pause(0.011);
    
  else
   
  end
end
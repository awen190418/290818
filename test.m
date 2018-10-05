
screenMapX=[1111 1195 1273 1352 1440 1552 1599 1684];
screenMapY=[865 790 715 635 570 500 420 350];



xS=[8.0 10.7 13.5 16.6 19.5 22.5 25.5 28 31];
yS=[7.5 10.5 13.5 17 20.0 23.5 26.5 29.5 33.5];

x=11.0;
y=11;


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

disp(screenMapX(gridX), screenMapY(gridY));



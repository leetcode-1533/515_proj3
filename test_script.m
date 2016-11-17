% For N >= 5
% Get input points (xy) 
clear

init_point = 7;

figure()
hold on
axis([0,1,0,1])
for i = 1:init_point
     [xy(1,i), xy(2,i)] = ginput(1);    
     plot(xy(1,:),xy(2,:), 'b*'); 
end
% Use the script to plot the bazier curve
% scatter(xy(1,:), xy(2,:),'r*')
% scatter(dpoints(1,:), dpoints(2,:), 'ko')
hold on
plot_bazier(con1(xy), 'r');
plot_bazier(con2(xy), 'g');
plot_bazier(con3(xy), 'b');
plot_bazier(con4(xy), 'y');

figure()
subplot(2,2,1);
scatter(xy(1,:), xy(2,:),'b*')
plot_bazier(con1(xy), 'r');
title('end condition 1');
subplot(2,2,2);
scatter(xy(1,:), xy(2,:),'b*')
plot_bazier(con2(xy), 'g');
title('end condition 2');

subplot(2,2,3);
scatter(xy(1,:), xy(2,:),'b*')
plot_bazier(con3(xy), 'b');
title('end condition 3');

subplot(2,2,4);
scatter(xy(1,:), xy(2,:),'b*')
plot_bazier(con4(xy), 'y');
title('end condition 4');

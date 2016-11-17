% For N >= 5
% Get input points (xy) 
clear
hold on

init_point = 7;
axis([0,1,0,1])

for i = 1:init_point
     [xy(1,i), xy(2,i)] = ginput(1);    
     plot(xy(1,:),xy(2,:), 'b*'); 
end
% Use different end condition to calculate control points
dpoints = con4(xy);

% Use the script to plot the bazier curve
% scatter(xy(1,:), xy(2,:),'r*')
% scatter(dpoints(1,:), dpoints(2,:), 'ko')

plot_bazier(con1(xy), 'r');
plot_bazier(con2(xy), 'g');
plot_bazier(con3(xy), 'b');
plot_bazier(con4(xy), 'y');


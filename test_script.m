% For N >= 5

% Get input points (xy) 
clear
hold on
init_point = 5;
axis([0,1,0,1])
for i = 1:init_point
     [xy(1,i), xy(2,i)] = ginput(1);    
     plot(xy(1,:),xy(2,:), 'c*-'); 
end
% Use different end condition to calculate control points


% Use the script to plot the bazier curve

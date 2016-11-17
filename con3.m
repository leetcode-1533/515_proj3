function dpoints = con3(xy)

%% Calculate control point from input points using the first end condition when n >= 5
% N+1 points
x_points = xy(1,:);
y_points = xy(2,:);
N = length(x_points);

%% calculate x
d_vector = cal1d(x_points, N);
dpoints(1,:) = d_vector';

%% calculate y
d_vector = cal1d(y_points, N);
dpoints(2,:) = d_vector';


function d_vector = cal1d(points, N)
% N + 1 -> N +3
matrix = full(gallery('tridiag',N-2,1,4,1));
matrix(1,1) = 7/2;
matrix(end, end) = 7/2;
vector = [6*points(2) - 1.5*points(1); 6*points(3:end-2)'; 6*points(end-1) - 1.5*points(end)];

d_vector = inv(matrix) * vector;
d_vector = [points(1); 0.5*points(1) + 0.5*(points(2) + (points(2) - points(3))/3); d_vector; 0.5*(points(end-1) + (points(end-1)-points(end-2))/3)+0.5*points(end); points(end)];
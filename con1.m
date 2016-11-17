function dpoints = con1(xy)

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
vector = [6*points(2) - points(1); 6*points(3:end-2)'; 6*points(end-1) - points(end)];

d_vector = inv(matrix) * vector;
d_vector = [points(1); 2*points(1)/3 + d_vector(1)/3; d_vector; d_vector(end)/3 + 2*points(end)/3; points(end)];
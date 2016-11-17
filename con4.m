function dpoints = con4(xy)

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
matrix = full(gallery('tridiag',N-4,1,4,1));
vector = [6*points(3) + points(1)/6-4*points(2)/3+points(3)/6; ...
    6*points(4:end-3)'; ...
    6*points(end-2)+points(end-2)/6-4*points(end-1)/3+points(end)/6];

d_vector = inv(matrix) * vector;

d_vector = [points(1); ...
    7*points(1)/18+8*points(2)/9+7*points(3)/18-2*d_vector(1)/3; ...
    -points(1)/6+4*points(2)/3-points(3)/6; ...
    d_vector; ...
    -points(end-2)/6+4*points(end-1)/3-points(end)/6; ...
    7*points(end-2)/18+8*points(end-1)/9+7*points(end)/18-2*d_vector(end)/3; ...
    points(end)];
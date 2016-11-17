function [L,A] = LUfact(A)
%Input: an invertible matrix A
%Output: a lower triangular matrix L with Lii = 1 for i in [1,n]
%Output: a upper triangular matrix U and A = LU

%check if A is invertable
if (rank(A)~= min(size(A)))
    error ('input must be invertable matrix');
end

n = min(size(A));
L = eye(n);

for col = 1:(n-1)
    L(col:n,col) = A(col:n,col)/A(col,col);
    for i = col+1:n
        A(i,:) = A(i,:)-A(col,:)/A(col,col)*A(i,col);
    end
end



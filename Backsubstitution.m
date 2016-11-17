function x = Backsubstitution(A,b)
%input: A is a triangular matrix, b is a col vector
%output: return x where Ax = b

%check if A is triangular
if (istriu(A)==0) & (istriu(transpose(A))==0)
    error('input is not a triangular matrix');
end
%check if A and b are of the same row dimension
if size(A,1)~= max(size(b))
    error('A and b must of the same row dimension');
end

%initializations 
n = size(A,1);
if (size(b,2) >= size(b,1))
    b = transpose(b);
end
x = b*0;
x(n,1) = b(n,1)/A(n,n);

for row = n-1:-1:1
    temp = b(row,1);
    for i = row+1:n
        temp = temp-x(i,1)*A(row,i);
    end
    x(row,1) = temp/A(row,row);
end

            
    
    
    
    
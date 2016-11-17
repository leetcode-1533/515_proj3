function x = Forwardsubstitution(A,b)
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
x(1,1) = b(1,1)/A(1,1);

for row = 2:1:n
    temp = b(row,1);
    for i = 1:row-1
        temp = temp-x(i,1)*A(row,i);
    end
    x(row,1) = temp/A(row,row);
end

            
    
    
    
    
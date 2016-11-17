function [M,P,U] = Gaussian(A)
    %input: an nxn matrix A
    %output: an upper triangular nxn matrix U and an invertible matrix M, where U=MA
    %output: P is the product of all transposition matrix. It indicates
    %whether pivoting is used during gaussian elimination. If P == I, it
    %means no pivoting is used. Otherwise, partial pivoting is used.

    n = size(A,1);
    %Check whether A is a square matrix
    if (size(A,1)~= size(A,2))
        error('the input must be a square matrix!');
    end
    M = eye(n);
    P = eye(n);


    for col =1:n-1
        
        %find the row with max pivot value
        [maxvalue, pivot] = max(A(col:n,col));
        pivot = pivot+col-1;

        %compute Transposition matrix Pi and do the pivoting
        Pi = eye(n);
        temp = Pi(col,:);
        Pi(col,:) = Pi(pivot,:);
        Pi(pivot,:)=temp;
        M=Pi*M;
        P=Pi*P;
        if col == 1
            U = Pi*A;
        else
            U = Pi*U;
        end

        %compute elementary marix E and do the elimination for the lower
        %rows
        for row = col+1:n
            E = eye(n);
            beta = - U(row,col)/maxvalue;
            E(row,col)=beta;
            M=E*M;
            U=E*U;
            
        end


    end
    
    
    
    
    
    
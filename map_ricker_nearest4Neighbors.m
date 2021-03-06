function [ N ] = map_ricker_nearest4Neighbors ( iteration, b, r, n, s )
%Initial conditions
N=zeros(iteration, n); 
rand('seed', s)
N(1,:) = rand(1,n)+.5;
a=1-4*b;
%Map of Ricker connecting to nearest 4  neighbors
for i=2:iteration
    for j=1:n
        if j==2
            N(i,2)=b*(N(i-1,n)*exp(r*(1-N(i-1,n))))...
                  +b*(N(i-1,1)*exp(r*(1-N(i-1,1))))...
                  +a*(N(i-1,2)*exp(r*(1-N(i-1,2))))...
                  +b*(N(i-1,3)*exp(r*(1-N(i-1,3))))...
                  +b*(N(i-1,4)*exp(r*(1-N(i-1,4))));
        elseif j==1
            N(i,1)=b*(N(i-1,n-1)*exp(r*(1-N(i-1,n-1))))...
                  +b*(N(i-1,n)*exp(r*(1-N(i-1,n))))...
                  +a*(N(i-1,1)*exp(r*(1-N(i-1,1))))...
                  +b*(N(i-1,2)*exp(r*(1-N(i-1,2))))...
                  +b*(N(i-1,3)*exp(r*(1-N(i-1,3))));
        elseif j==n
            N(i,n)=b*(N(i-1,n-2)*exp(r*(1-N(i-1,n-2))))...
                  +b*(N(i-1,n-1)*exp(r*(1-N(i-1,n-1))))...
                  +a*(N(i-1,n)*exp(r*(1-N(i-1,n))))...
                  +b*(N(i-1,1)*exp(r*(1-N(i-1,1))))...
                  +b*(N(i-1,2)*exp(r*(1-N(i-1,2))));
        elseif j==n-1
          N(i,n-1)=b*(N(i-1,n-3)*exp(r*(1-N(i-1,n-3))))...
                  +b*(N(i-1,n-2)*exp(r*(1-N(i-1,n-2))))...
                  +a*(N(i-1,n-1)*exp(r*(1-N(i-1,n-1))))...
                  +b*(N(i-1,n)*exp(r*(1-N(i-1,n))))...
                  +b*(N(i-1,1)*exp(r*(1-N(i-1,1))));
        else
            N(i,j)=b*(N(i-1,j-2)*exp(r*(1-N(i-1,j-2))))...
                  +b*(N(i-1,j-1)*exp(r*(1-N(i-1,j-1))))...
                  +a*(N(i-1,j)*exp(r*(1-N(i-1,j))))...
                  +b*(N(i-1,j+1)*exp(r*(1-N(i-1,j+1))))...
                  +b*(N(i-1,j+2)*exp(r*(1-N(i-1,j+2))));
        end
    end
end

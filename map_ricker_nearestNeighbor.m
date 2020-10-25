function [ N ] = map_ricker_nearestNeighbor ( iteration, b, r, n, s )
N=zeros(iteration, n); % Initial conditions
rand('seed', s)
N(1,:) = rand(1,n)+.5;
a=1-2*b;
for i=2:iteration      % Map of Ricker connecting to nearest neighbor
    for j=1:n
        if j==1
            N(i,1)=b*(N(i-1,n)*exp(r*(1-N(i-1,n))))...
                  +a*(N(i-1,1)*exp(r*(1-N(i-1,1))))...
                  +b*(N(i-1,2)*exp(r*(1-N(i-1,2))));
        elseif j==n
            N(i,n)=b*(N(i-1,n-1)*exp(r*(1-N(i-1,n-1))))...
                  +a*(N(i-1,n)*exp(r*(1-N(i-1,n))))...
                  +b*(N(i-1,1)*exp(r*(1-N(i-1,1))));
        else
            N(i,j)=b*(N(i-1,j-1)*exp(r*(1-N(i-1,j-1))))...
                  +a*(N(i-1,j)*exp(r*(1-N(i-1,j))))...
                  +b*(N(i-1,j+1)*exp(r*(1-N(i-1,j+1))));
        end
    end
end

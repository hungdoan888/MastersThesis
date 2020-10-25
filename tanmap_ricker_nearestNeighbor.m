function [ tanmap ] = tanmap_ricker_nearestNeighbor ( Ni, b, r, n )
a=1-2*b;         % Initial conditions
tanmap=zeros(n);
for i=1:n        % Tangent map
    if i==1
        tanmap(1,n)=b*(exp(r*(1-Ni(n)))*(1-r*Ni(n)));
        tanmap(1,1)=a*(exp(r*(1-Ni(1)))*(1-r*Ni(1)));
        tanmap(1,2)=b*(exp(r*(1-Ni(2)))*(1-r*Ni(2)));      
    elseif i==n
        tanmap(n,n-1)=b*(exp(r*(1-Ni(n-1)))*(1-r*Ni(n-1)));
        tanmap(n,n)=a*(exp(r*(1-Ni(n)))*(1-r*Ni(n)));
        tanmap(n,1)=b*(exp(r*(1-Ni(1)))*(1-r*Ni(1)));  
    else
        tanmap(i,i-1)=b*(exp(r*(1-Ni(i-1)))*(1-r*Ni(i-1)));
        tanmap(i,i)=a*(exp(r*(1-Ni(i)))*(1-r*Ni(i)));
        tanmap(i,i+1)=b*(exp(r*(1-Ni(i+1)))*(1-r*Ni(i+1)));
    end
end
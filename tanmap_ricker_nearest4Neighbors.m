function [ tanmap ] = tanmap_ricker_nearest4Neighbors ( Ni, b, r, n )
%Initial conditions
a=1-4*b;
tanmap=zeros(n);
%Find tangent map
for i=1:n
    if i==2
        tanmap(2,n)=b*(exp(r*(1-Ni(n)))*(1-r*Ni(n)));
        tanmap(2,1)=b*(exp(r*(1-Ni(1)))*(1-r*Ni(1)));
        tanmap(2,2)=a*(exp(r*(1-Ni(2)))*(1-r*Ni(2)));
        tanmap(2,3)=b*(exp(r*(1-Ni(3)))*(1-r*Ni(3)));
        tanmap(2,4)=b*(exp(r*(1-Ni(4)))*(1-r*Ni(4)));
        
    elseif i==1
        tanmap(1,n-1)=b*(exp(r*(1-Ni(n-1)))*(1-r*Ni(n-1)));
        tanmap(1,n)=b*(exp(r*(1-Ni(n)))*(1-r*Ni(n)));
        tanmap(1,1)=a*(exp(r*(1-Ni(1)))*(1-r*Ni(1)));
        tanmap(1,2)=b*(exp(r*(1-Ni(2)))*(1-r*Ni(2)));
        tanmap(1,3)=b*(exp(r*(1-Ni(3)))*(1-r*Ni(3)));
        
    elseif i==n
        tanmap(n,n-2)=b*(exp(r*(1-Ni(n-2)))*(1-r*Ni(n-2)));
        tanmap(n,n-1)=b*(exp(r*(1-Ni(n-1)))*(1-r*Ni(n-1)));
        tanmap(n,n)=a*(exp(r*(1-Ni(n)))*(1-r*Ni(n)));
        tanmap(n,1)=b*(exp(r*(1-Ni(1)))*(1-r*Ni(1)));
        tanmap(n,2)=b*(exp(r*(1-Ni(2)))*(1-r*Ni(2)));
        
    elseif i==n-1
        tanmap(n-1,n-3)=b*(exp(r*(1-Ni(n-3)))*(1-r*Ni(n-3)));
        tanmap(n-1,n-2)=b*(exp(r*(1-Ni(n-2)))*(1-r*Ni(n-2)));
        tanmap(n-1,n-1)=a*(exp(r*(1-Ni(n-1)))*(1-r*Ni(n-1)));
        tanmap(n-1,n)=b*(exp(r*(1-Ni(n)))*(1-r*Ni(n)));
        tanmap(n-1,1)=b*(exp(r*(1-Ni(1)))*(1-r*Ni(1)));
        
    else
        tanmap(i,i-2)=b*(exp(r*(1-Ni(i-2)))*(1-r*Ni(i-2)));
        tanmap(i,i-1)=b*(exp(r*(1-Ni(i-1)))*(1-r*Ni(i-1)));
        tanmap(i,i)=a*(exp(r*(1-Ni(i)))*(1-r*Ni(i)));
        tanmap(i,i+1)=b*(exp(r*(1-Ni(i+1)))*(1-r*Ni(i+1)));
        tanmap(i,i+2)=b*(exp(r*(1-Ni(i+2)))*(1-r*Ni(i+2)));
    end
end
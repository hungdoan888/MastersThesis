function [ LCEvector ] = LCE( map, tanmap, iteration, lce_iteration, b, r, n, s )
LCEvector = zeros(n,1);                          % Initializing Variables
R = zeros(n,1);
N = feval( map, iteration+1, b, r, n, s );       % Create the map of   N
Ni_1 = N(iteration-lce_iteration+1,:);           % Create 1st and 2nd tanmaps
Ni_2 = N(iteration-lce_iteration+2,:);
tanmap1 = feval( tanmap, Ni_1, b, r, n );
tanmap2 = feval( tanmap, Ni_2, b, r, n );
for i = 1:lce_iteration                          % QR-factorization
    for k = 1:n-1        
        sigma = sqrt(sum(tanmap1(k:n, k).^2));   % Computation of the reflectors
        gamma = sigma * (sigma+abs(tanmap1(k, k)));
        if tanmap1(k, k)<0
            R(k) = sigma;
        else
            R(k) = -sigma;
        end
        tanmap1(k,k) = tanmap1(k, k) - R(k);        
        for j = k+1:n
            beta = (tanmap1(k:n, k)' * tanmap1(k:n, j)) / gamma;
            tanmap1(k+1:n, j) = tanmap1(k+1:n, j)-tanmap1(k+1:n, k) * beta;
        end       
        for j = 1:n                              % Computation of action of tanmap2
            beta = tanmap2(j, k:n)*tanmap1(k:n, k) / gamma;
            tanmap2(j, k:n) = tanmap2(j, k:n) - tanmap1(k:n, k)' * beta;
        end
    end
    R(n) = tanmap1(n, n);    
    if i ~= lce_iteration                        % Changing tanmap to next iteration
        tanmap1 = tanmap2;                       % New tanmap1
        Ni_2 = N(iteration-lce_iteration+2+i,:); % New tanmap2
        [ tanmap2 ] = feval(tanmap, Ni_2, b, r, n);
    end
    LCEvector = LCEvector + log(abs(R));
end   
LCEvector = LCEvector / lce_iteration;    


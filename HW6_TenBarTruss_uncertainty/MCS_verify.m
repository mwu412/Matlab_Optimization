r_origin = [9.5809, 0.235];
%% params
length = 9.14 ;                 % unit: m
E = 200e9 ;                     % unit: Pa

F = zeros(12,1) ;               % unit: N
% Array F is composed of the external forces applied on each node. 
% The elements in F are respectively F1x, F1y, F2x, F2y, F3x, F3y, ...

yeild_strength = 250e6 ;        % unit: Pa
rho = 7860 ;  

%% uncertainty
samples = 1000000;

fail = 0;

for i = 1:samples
    r = normrnd(r_origin, sqrt(r_origin/10)); % mu, standard_deviation
    F(4) = normrnd(-1e7, sqrt(1e6)) ;

    % calculation
    [stress, Q] = TenBarAnalysis( r, length, E, F );

    buckle = zeros(10,1);

    for i=1:6
        buckle(i,:) = -stress(i,:)*pi*r(1)^2 - pi^2*E*pi*r(1)^4/4/length^2; 
    end

    for i=7:10
        buckle(i,:) = -stress(i,:)*pi*r(2)^2 - pi^2*E*pi*r(2)^4/4/(length*sqrt(2))^2;
    end
    
    
    if(abs(stress)*1e-6 - yeild_strength*1e-6)>0
        fail = fail + 1;
        continue
    end
    
    if(buckle*1e-6)>0
        fail = fail + 1;
        continue
    end
    
    if(sqrt(Q(3)^2+Q(4)^2) - 0.02)>0
        fail = fail + 1;
        continue
    end
end

p_fail = fail/samples

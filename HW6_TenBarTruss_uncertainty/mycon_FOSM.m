function [c,ceq] = mycon_FOSM(r)
%% params
length = 9.14 ;                 % unit: m
E = 200e9 ;                     % unit: Pa

F = zeros(12,1) ;
F(4) = -1e7;
% unit: N
% Array F is composed of the external forces applied on each node. 
% The elements in F are respectively F1x, F1y, F2x, F2y, F3x, F3y, ...

yeild_strength = 250e6 ;        % unit: Pa
rho = 7860 ;  

%% uncertainty
    

    % calculation
    [stress, Q] = TenBarAnalysis( r, length, E, F );

    buckle = zeros(10,1);

    for i=1:6
        buckle(i,:) = -stress(i,:)*pi*r(1)^2 - pi^2*E*pi*r(1)^4/4/length^2; 
    end

    for i=7:10
        buckle(i,:) = -stress(i,:)*pi*r(2)^2 - pi^2*E*pi*r(2)^4/4/(length*sqrt(2))^2;
    end
    
%% FOSM
    stdx=[sqrt(r(1)/10),sqrt(r(2)/10)];
    pf1 = zeros(10,1);
    pf2 = zeros(10,1);
    pf3 = 0;
%% c1
    mu1 = stress*1e-6 - yeild_strength*1e-6;  
    for i=1:6
        a1 = -2*stress(i)*1e-6/r(1);
        a2 = 0;
        sig=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
        pf1(i) = 1-normcdf((0-mu1(i))/sig);
    end
    for i=7:10
        a1 = 0;
        a2 = -2*stress(i)*1e-6/r(2);
        sig=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
        pf1(i) = 1-normcdf((0-mu1(i))/sig);
    end
%% c2
    mu2 = buckle*1e-6;
    for i=1:6
        a1 = - pi^2*E*pi*r(1)^3/length^2;
        a2 = 0;
        sig=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
        pf2(i) = 1-normcdf((0-mu2(i))/sig);
    end
    for i=7:10
        a1 = 0;
        a2 = - pi^2*E*pi*r(2)^3/length^2;
        sig=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
        pf2(i) = 1-normcdf((0-mu2(i))/sig);
    end
%% c3    
    mu3 = sqrt(Q(3)^2+Q(4)^2) - 0.02;
    a1 = 0.5*(Q(3)^2+Q(4)^2)*(2*Q(3)*(-2)*Q(3)/r(1)+2*Q(4)*(-2)*Q(4)/r(1));
    a2 = 0;
    sig=sqrt(a1^2*stdx(1)^2+a2^2*stdx(2)^2);
    pf3 = 1-normcdf((0-mu3)/sig);


c1 = pf1 - 0.01;
c2 = pf2 - 0.01;
c3 = pf3 - 0.01;

c = [c1; c2; c3];
ceq = [];

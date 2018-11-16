function [c,ceq] = mycon(r)

length = 9.14 ;                 % unit: m
E = 200e9 ;                     % unit: Pa

F = zeros(12,1) ;               % unit: N
F(4) = -1e7 ;
% Array F is composed of the external forces applied on each node. 
% The elements in F are respectively F1x, F1y, F2x, F2y, F3x, F3y, ...

yeild_strength = 250e6 ;               % unit: Pa
rho = 7860 ;  

[stress, Q] = TenBarAnalysis( r, length, E, F );

buckle = zeros(10,1);

for i=1:6
    buckle(i,:) = -stress(i,:)*pi*r(1)^2 - pi^2*E*pi*r(1)^4/4/length^2; 
end

for i=7:10
    buckle(i,:) = -stress(i,:)*pi*r(2)^2 - pi^2*E*pi*r(2)^4/4/(length*sqrt(2))^2;
end

c1 = abs(stress)*1e-6 - yeild_strength*1e-6;

c2 = buckle*1e-6;

c3 = sqrt(Q(3)^2+Q(4)^2) - 0.02;

%c1 = cat(1, c1(1:5), c1(7:10));  % ignore c1(6) to check which is active constraint
%c2 = cat(1, c2(1:5), c2(7:10));  % ignore c2(6) to check which is active constraint

c = [c1; c2; c3];
%c = [c1; c2];  % ignore c3 to check which is active constraint

ceq = [];

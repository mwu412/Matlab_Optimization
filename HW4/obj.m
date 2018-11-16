function f = obj( r )

l = 9.14 ;  % m
density = 7860 ;  % kg/m^3
f = (6*pi*r(1)^2 + 4*pi*r(2)^2*sqrt(2)) * l * density ;